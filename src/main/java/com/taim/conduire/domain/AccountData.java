package com.taim.conduire.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;

import java.io.Serializable;
import java.security.Principal;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "account")
public class AccountData implements UserDetails, Principal, Serializable {
    private static final long serialVersionUID = 1L;

    public enum AccountStatus {PENDING_VERIFICATION, ACTIVE, SUSPEND, DELETE}

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Access(AccessType.PROPERTY)
    private Integer id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "password")
    private String password;

    @Column(name = "username")
    private String username;

   
    @Column(name = "account_type")
    private String accountType;

    @Column(name = "email")
    private String email;

    @Column(name = "createdate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdate;

    @Column(name = "system_generated")
    private String systemGenerated;

    @Column(name = "account_status")
    private String accountStatus;

    @Column(name = "welcome_email_sent")
    private String welcomeEmailSent;

    @Column(name = "verification_code")
    private String verificationCode;

    @Column(name = "shopify_store_url")
    private String shopifyStoreUrl;

    @Column(name = "access_token")
    private String accessToken;

    @Column(name = "visible")
    private char visible;

    public AccountData() {
    }

    public AccountData(String fname, String lname, String username, String password, String email) {
        this.firstName = fname;
        this.lastName = lname;
        this.username = username;
        this.password = password;
        this.email = email;
    }

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getSystemGenerated() {
		return systemGenerated;
	}

	public void setSystemGenerated(String systemGenerated) {
		this.systemGenerated = systemGenerated;
	}

	public String getWelcomeEmailSent() {
		return welcomeEmailSent;
	}

	public void setWelcomeEmailSent(String welcomeEmailSent) {
		this.welcomeEmailSent = welcomeEmailSent;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	public String getShopifyStoreUrl() {
		return shopifyStoreUrl;
	}

	public void setShopifyStoreUrl(String shopifyStoreUrl) {
		this.shopifyStoreUrl = shopifyStoreUrl;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public char getVisible() {
		return visible;
	}

	public void setVisible(char visible) {
		this.visible = visible;
	}

	@Override
	public String toString() {
		return "AccountData [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", password="
				+ password + ", username=" + username + ", accountType=" + accountType + ", email=" + email
				+ ", createdate=" + createdate + ", systemGenerated=" + systemGenerated + ", accountStatus="
				+ accountStatus + ", welcomeEmailSent=" + welcomeEmailSent + ", verificationCode=" + verificationCode
				+ ", shopifyStoreUrl=" + shopifyStoreUrl + ", accessToken=" + accessToken + ", visible=" + visible
				+ "]";
	}

	@Override
    public String getName() {
        return getUsername();
    }

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		 if (getAccountType() == null) {
	            return Collections.emptyList();
	        }
	        return Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + getAccountType()));
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		 return "ACTIVE".equalsIgnoreCase(accountStatus) && !"D".equalsIgnoreCase("" +visible);
	}

	@Override
    public boolean equals(final Object o) {
        if (this == o)
            return true;
        if (!(o instanceof AccountData))
            return false;
        final AccountData that = (AccountData) o;
        return Objects.equals(getUsername(), that.getUsername());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getUsername());
    }
}
