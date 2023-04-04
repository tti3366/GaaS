package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import controller.ChatController;
import controller.LoginController;
import controller.ClubController;
import controller.IndexController;

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
	
	@Bean ClubController clubController() {
		return new ClubController();
	}
	
	@Bean IndexController indexController() {
		return new IndexController();
	}
	
}
