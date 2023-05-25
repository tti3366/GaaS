package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.ClubDao;
import dao.ClubUsersDao;
import dao.DeptDao;
import dao.PostDao;
import dao.UserDao;
import model.ChangePwd;
import model.Club;
import model.ClubUsers;
import model.Dept;
import model.Post;
import model.User;
import service.ClubService;
import service.ClubUsersService;
import service.DeptService;
import service.LoginService;
import service.ManageService;
import service.PostService;
import service.UserCRUDService;
import serviceImpl.ClubServiceImpl;
import serviceImpl.ClubUsersServiceImpl;
import serviceImpl.DeptServiceImpl;
import serviceImpl.LoginServiceImpl;
import serviceImpl.ManageServiceImpl;
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
	public Dept dept() {
		return new Dept();
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
	public ClubUsers clubUsers() {
		return new ClubUsers();
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

	@Bean
	public ManageService manageServiceImpl() {
		return new ManageServiceImpl();
	}
	
	@Bean
	public ClubUsersDao clubUsersDao() {
		return new ClubUsersDao();
	}
	
	@Bean
	public ClubUsersService clubUserServiceImpl() {
		return new ClubUsersServiceImpl();
	}
}
