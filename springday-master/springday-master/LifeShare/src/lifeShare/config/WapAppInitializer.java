package lifeShare.config;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class WapAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	private static int MAX_FILE_ZIZE = 10 * 1024 * 1024;
	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] {ApplicationConfig.class}; //->MyBatis ,DB연동 
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] {MvcConfig.class};  //뷰 리졸버 , 컨트롤러 , 핸들러 매핑 
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("utf-8");
		
		return new Filter[] {encodingFilter};
	}
	
	@Override
	protected void customizeRegistration(Dynamic registration) {
	      MultipartConfigElement multipartConfig = new MultipartConfigElement("images", MAX_FILE_ZIZE, MAX_FILE_ZIZE, 0);
	      registration.setMultipartConfig(multipartConfig);
	}
}
