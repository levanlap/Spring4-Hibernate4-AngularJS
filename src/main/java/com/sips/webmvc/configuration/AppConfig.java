package com.sips.webmvc.configuration;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@EnableWebMvc
@Configuration
@ComponentScan(basePackages = { "com.sips.webmvc" })
@EnableTransactionManagement
@Import({ SecurityConfig.class })
public class AppConfig extends WebMvcConfigurerAdapter {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/resources/backend/*");
		registry.addResourceHandler("/frontend/images/**").addResourceLocations("/WEB-INF/resources/frontend/images/*");
		registry.addResourceHandler("/frontend/frontend/images/**").addResourceLocations("/WEB-INF/resources/frontend/images/*");
		registry.addResourceHandler("/frontend/js/**").addResourceLocations("/WEB-INF/resources/frontend/js/*");
		registry.addResourceHandler("/frontend/css/**").addResourceLocations("/WEB-INF/resources/frontend/css/*");
		registry.addResourceHandler("/frontend/fonts/**").addResourceLocations("/WEB-INF/resources/frontend/fonts/*");
		registry.addResourceHandler("/frontend/img/**").addResourceLocations("/WEB-INF/resources/frontend/img/*");
		registry.addResourceHandler("/frontend/less/**").addResourceLocations("/WEB-INF/resources/frontend/less/*");
		registry.addResourceHandler("/frontend/css_mini/**").addResourceLocations("/WEB-INF/resources/frontend/css_mini/*");
		
		//BACKEND 2
		registry.addResourceHandler("/backend/dist/**").addResourceLocations("/WEB-INF/resources/backend/dist/*");
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setBasename("messages");
		return messageSource;
	}

	/**
	 * <code>Resolves views selected for rendering by @Controllers to tiles resources in the Apache TilesConfigurer bean</code>
	 */
	@Bean
	public UrlBasedViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(TilesView.class);
		viewResolver.setOrder(1);
		return viewResolver;
	}

	/**
	 * <code>Configures Apache tiles definitions bean used by Apache TilesViewResolver to resolve views selected for rendering by @Controllers</code>
	 */
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] { "/WEB-INF/tiles.xml" });
		tilesConfigurer.setCheckRefresh(true);
		return tilesConfigurer;
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(1000000000);
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}
	
	public void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(fronendInterceptor());
	}
	
	@Bean
	public FrontendLoginInterceptor fronendInterceptor() {
		return new FrontendLoginInterceptor();
	}
}