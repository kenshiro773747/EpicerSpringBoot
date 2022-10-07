package com.epicer.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
//@EnableWebMvc  可省略
//@ComponentScan(basePackages = {"com.epicer."}) 預設此路徑下開始掃描，所以可省略
public class WebAppConfig implements WebMvcConfigurer {


	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/HelloTeacher/css/**").addResourceLocations("/WEB-INF/resources/css/");
		
		registry.addResourceHandler("/reciperesult/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
		//註冊圖片路徑
		registry.addResourceHandler("/queryByCourseStyle/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/HelloTeacher/images/**").addResourceLocations("/WEB-INF/resources/images/");
		//
		registry.addResourceHandler("/HelloTeacher/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		
		
		registry.addResourceHandler("/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		
		registry.addResourceHandler("/queryByCourseStyle/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/HelloTeacher/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/reciperesult/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/recipeForUpdate/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		registry.addResourceHandler("/to/assets/**").addResourceLocations("/WEB-INF/resources/assets/");
		//註冊for前台頁面
		registry.addResourceHandler("/source/**").addResourceLocations("/WEB-INF/resources/source/");
	}

	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {

		registry.addRedirectViewController("/",	"redirect:/recipe" );
		registry.addViewController("to/add").setViewName("recipe/AddPage");
		
	}
	
	
//	@Bean
//	public CharacterEncodingFilter characterEncodingFilter(){
//		CharacterEncodingFilter filter = new CharacterEncodingFilter();
//		filter.setEncoding("UTF-8");
//		filter.setForceEncoding(true);
//		return filter;
//	}


	
	
	
}

