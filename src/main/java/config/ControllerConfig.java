package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import controller.AdminController;
import controller.ChatController;
import controller.ClubController;
import controller.IndexController;
import controller.LoginController;
import controller.ManagerController;
import controller.MyPageController;
import controller.PostController;
import controller.ReplyController;

//컨트롤러 설정 클래스
@Configuration
public class ControllerConfig {
	
	@Bean
	public LoginController loginController() {
		return new LoginController();
	}
	
	@Bean
	public ChatController chatController() {
		return new ChatController();
	}
	
	@Bean
	public PostController postController() {
		return new PostController();
	}
	
	@Bean ClubController clubController() {
		return new ClubController();
	}
	
	@Bean IndexController indexController() {
		return new IndexController();
	}
	
	@Bean MyPageController myPageController() {
		return new MyPageController();
	}

	@Bean AdminController adminController() {
		return new AdminController();
  }
	
	@Bean ManagerController managerController() {
		return new ManagerController();
	}
	
	@Bean ReplyController replyController() {
		return new ReplyController();
	}
  
	//이미지 첨부를 위한 설정
	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(10485760); // 최대 업로드 크기 설정 (10MB)
		// 필요한 추가 설정들
		return multipartResolver;
	}
}