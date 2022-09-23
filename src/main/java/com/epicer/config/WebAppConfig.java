package com.epicer.config;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
//@EnableWebMvc  可省略
//@ComponentScan(basePackages = {"com.epicer."}) 預設此路徑下開始掃描，所以可省略
public class WebAppConfig implements WebMvcConfigurer {


	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
	}

//	@Override 沒用或是我不會用
//	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/form").setViewName("Register");
//		registry.addViewController("/index").setViewName("index");
//	}
//	
//	@Bean
//	public InternalResourceViewResolver internalviewresolver() {
//		InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
//		return internalResourceViewResolver;
//	}
	
}

