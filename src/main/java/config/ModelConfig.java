package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.ClubDao;
import dao.UserDao;
import model.User;
import service.ClubService;
import service.LoginService;
import serviceImpl.ClubServiceImpl;
import serviceImpl.LoginServiceImpl;

//모델 설정 클래스
@Configuration
public class ModelConfig {
	
	@Bean
	public User user() {
		return new User();
	}
	
	@Bean
	public LoginService loginServiceImpl() {
		return new LoginServiceImpl();
	}
	@Bean
	public UserDao userDao() {
		return new UserDao();
	}
	
	@Bean ClubService clubServiceImpl() {
		return new ClubServiceImpl();
	}
	
	@Bean ClubDao clubDao() {
		return new ClubDao();
	}
}
