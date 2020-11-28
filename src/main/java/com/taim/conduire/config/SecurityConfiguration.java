package com.taim.conduire.config;


import com.taim.conduire.service.AccountDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.RememberMeServices;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;
import java.util.UUID;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true, jsr250Enabled = true)
@Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    private static final String REMEMBER_ME_KEY = UUID.randomUUID().toString();
    private static final String REMEMBER_ME_PARAMETER = "rememberMe";
    private static final String REMEMBER_ME_COOKIE_NAME = "REMEMBER_ME";
    private static final int REMEMBER_ME_VALIDITY_SECONDS = 3 * 60 * 60;

    @Autowired
    private DataSource dataSource;

    @Autowired
    private AccountDataService userDetailsService;


    @Bean(name = "passwordEncoder")
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance(); //BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider(final UserDetailsService userDetailsService,
                                                               final PasswordEncoder passwordEncoder,
                                                               final MessageSource messageSource) {
        final DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setUserDetailsService(userDetailsService);
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder);
        daoAuthenticationProvider.setMessageSource(messageSource);
        return daoAuthenticationProvider;
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
        jdbcTokenRepository.setDataSource(dataSource);
        return jdbcTokenRepository;
    }

    @Bean
    public RememberMeServices rememberMeServices() {
        PersistentTokenBasedRememberMeServices rememberMeServices = new PersistentTokenBasedRememberMeServices("rememberMe", userDetailsService, persistentTokenRepository());
        rememberMeServices.setAlwaysRemember(true);
        rememberMeServices.setCookieName(REMEMBER_ME_COOKIE_NAME);
        rememberMeServices.setParameter(REMEMBER_ME_PARAMETER);
        return rememberMeServices;
    }

    @Autowired
    public void configureGlobal(final AuthenticationManagerBuilder auth, final DaoAuthenticationProvider daoAuthenticationProvider) {
        auth.authenticationProvider(daoAuthenticationProvider);
    }

    @Override
    public void configure(final WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/api/*", "/fonts/**", "/icons/**","/plugins/**","/js/**","/css/**","/img/**",
                "/images/**", "/scripts/**", "/styles/**", "/vendor/**", "/error/**","/assets/**","/client/**","/hospital/**","/bloodnet/**","/adminnotification/**","/hospital-notification/**",
                "/hospital-notification/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable().exceptionHandling();
        http.headers().frameOptions().disable();
        http.authorizeRequests()
                .antMatchers("/", "/index", "/index.html","/shopify/product","client/updatebrowsenode","/multichannel/**","/admin/**","/shopify-product-webhook/**", "/login", "/logout").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/manager/**").hasRole("MANAGER")
                .antMatchers("/customer/**").hasRole("CUSTOMER")
                .anyRequest().authenticated()

                .and()
                .formLogin()
                .loginPage("/login")
                .failureUrl("/login?error=true")
                .successHandler(new SimpleUrlAuthenticationSuccessHandler("/"))
                .usernameParameter("username")
                .passwordParameter("password")
                .permitAll()

                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID", REMEMBER_ME_COOKIE_NAME)
                .permitAll()

                .and()
                .rememberMe()
                .rememberMeServices(rememberMeServices())
                .tokenValiditySeconds(REMEMBER_ME_VALIDITY_SECONDS)
                .key(REMEMBER_ME_KEY);
    }
}
