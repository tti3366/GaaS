package serviceImpl;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import dao.UserDao;
import model.User;
import service.LoginService;


//오라클에 맞게 수정하면 될듯
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	UserDao userDao;
	
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}
	
	public void selectAllUser() {
		userDao.selectAllUser();
	}
	
	
	public User selectUser(User user) throws Exception {
		return userDao.selectUser(user);
	}
	
	public List<String> selectClub(String userId) {
		return userDao.selectClub(userId);
	}
}
