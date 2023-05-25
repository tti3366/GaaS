package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import controller.AdminController;
import controller.ChatController;
import controller.ClubController;
import controller.IndexController;
import controller.LoginController;
import controller.ManagerController;
import controller.MyPageController;
import controller.PostController;

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

}
