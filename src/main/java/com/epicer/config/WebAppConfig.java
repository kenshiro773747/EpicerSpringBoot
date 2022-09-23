package com.epicer.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {


	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/reciperesult/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/reciperesult/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/recipeForUpdate/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/to/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
	}
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {

		registry.addRedirectViewController("/",	"redirect:/recipe" );
		registry.addViewController("to/add").setViewName("recipe/AddPage");
//		registry.addViewController("/happyfun.action").setViewName(	"form" );
//		registry.addViewController("/resource.show").setViewName("resourcesinfo");
		
	}

}
