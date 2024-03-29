package com.taim.conduire.config;

import javax.servlet.MultipartConfigElement;

import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {
	@Bean
	public MultipartConfigElement multipartConfigElement() {
	  MultipartConfigFactory factory = new MultipartConfigFactory();
	  factory.setMaxFileSize("10MB");
	  factory.setMaxRequestSize("10MB");
	  return factory.createMultipartConfig();
	}
	
	//@Bean public com.taim.conduire.schedulers.DownloadShopifyProductsScheduler downloadShopifyProductsScheduler() {return new com.taim.conduire.schedulers.DownloadShopifyProductsScheduler();}
}
