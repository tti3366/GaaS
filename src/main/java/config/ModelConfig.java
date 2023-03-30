package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.ClubDao;
import dao.UserDao;
import model.Club;
import model.User;
import service.CreateClubService;
import service.LoginService;
import serviceImpl.CreateClubServiceImpl;
import serviceImpl.LoginServiceImpl;

//모델 설정 클래스
@Configuration
public class ModelConfig {
	
	@Bean
	public User user() {
		return new User();
	}
	
	@Bean
	public Club club() {
		return new Club();
	}
	
	@Bean
	public LoginService loginServiceImpl() {
		return new LoginServiceImpl();
	}
	
	@Bean
	public CreateClubService createClubServiceImpl() {
		return new CreateClubServiceImpl();
	}
	
	@Bean
	public UserDao userDao() {
		return new UserDao();
	}
	
	@Bean
	public ClubDao clubDao() {
		return new ClubDao();
	}
}
