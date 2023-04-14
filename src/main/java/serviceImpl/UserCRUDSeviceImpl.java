package serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDao;
import model.ChangePwd;
import model.User;
import service.UserCRUDService;

public class UserCRUDSeviceImpl implements UserCRUDService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public int changePwd(User user, ChangePwd changePwd) {
		return userDao.changePwd(user, changePwd);
	}

	@Override
	public int deleteUsers(User user) {
		return userDao.deleteUsers(user);
	}

}
