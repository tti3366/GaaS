package config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//mvc 기본 설정 클래스
@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer{

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/",".jsp");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry
		.addInterceptor(new MvcConfig.RequestHandler()) //핸들러를 지정
		.addPathPatterns("/**") //인터셉트할 기본 패턴을 지정
		.excludePathPatterns("", "/", "/login", "/loginCheck", "/logoutProc", "/signup", "/signupCheck", 
				"/validation", "/error", "/assets/**", "/css/**");	
		// 인터럽트 제외
	}

	public static final String SESSION_KEY = "SESSION";

	public class RequestHandler extends HandlerInterceptorAdapter {
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			Object session = request.getSession().getAttribute(SESSION_KEY);
			if(session == null) {
				System.out.println("session null");
				response.sendRedirect("/login"); // 세션 정보가 없을 경우, 로그인 필요
				return false;
			}
			else {
				return true;
			}
		}
	}
}
