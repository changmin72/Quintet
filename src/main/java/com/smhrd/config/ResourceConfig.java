package com.smhrd.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration // 해당 클래스를 기반으로 설정이 이루어져야 함을 명시
public class ResourceConfig implements WebMvcConfigurer {
	
	
	@Value("${save.path}")
	private String savepath;
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/save/**")//url pattern 추가
									// http://localhost:8091/boot/save/**
				.addResourceLocations("file:///"+"C:/save/");//URL과 폴더를 연결
		
	}

}
