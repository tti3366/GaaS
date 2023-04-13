package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.PostDao;
import dao.ClubDao;
import dao.DeptDao;
import dao.UserDao;
import model.ChangePwd;
import model.Club;
import model.Department;
import model.Post;

import model.User;
import service.ClubService;
import service.DeptService;
import service.LoginService;
import service.PostService;
import service.UserCRUDService;
import serviceImpl.ClubServiceImpl;
import serviceImpl.DeptServiceImpl;
import serviceImpl.LoginServiceImpl;
import serviceImpl.PostServiceImpl;
import serviceImpl.UserCRUDSeviceImpl;

//모델 설정 클래스
@Configuration
public class ModelConfig {
	
	@Bean
	public User user() {
		return new User();
	}
	
	@Bean
	public Department dept() {
		return new Department();
	}
	
	@Bean
	public Club club() {
		return new Club();
	}
	
	@Bean
	public Post post() {
		return new Post();
	}
	
	@Bean
	public ChangePwd changePwd() {
		return new ChangePwd();
	}
	
	@Bean
	public LoginService loginServiceImpl() {
		return new LoginServiceImpl();
	}
	@Bean
	public UserDao userDao() {
		return new UserDao();
	}
	
	@Bean 
	public ClubService clubServiceImpl() {
    return new ClubServiceImpl();
	}
	
	@Bean
	public PostDao postDao() {
		return new PostDao();
	}
	
	@Bean
	public PostService postServiceImpl() {
		return new PostServiceImpl();
	}
	
	@Bean 
	public ClubDao clubDao() {
		return new ClubDao();
	}
	
	@Bean 
	public DeptService deptServiceImpl() {
		return new DeptServiceImpl();
	}
	
	@Bean 
	public DeptDao deptDao() {
		return new DeptDao();
	}
	
	@Bean
	public UserCRUDService userCRUDServiceImpl() {
		return new UserCRUDSeviceImpl();
	}
	
}
