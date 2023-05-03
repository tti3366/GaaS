package serviceImpl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ClubDao;
import dao.DeptDao;
import dao.UserDao;
import model.Club;
import model.Dept;
import model.User;
import service.ManageService;

@Service
public class ManageServiceImpl implements ManageService {
	
	@Autowired
	UserDao userDao;
	

	@Autowired
	DeptDao deptDao;
	
	@Autowired
	ClubDao clubDao;
	
	public Map<String, Object> getAllTables() {
		Map<String, Object> map = new HashMap<>();
		
		map.put("users", userDao.getAllUsers());
		map.put("clubs", clubDao.getAllClubs());
		map.put("depts", deptDao.getAllDeparts());
		return map;
	}

	public int modifyUser(User user) {
		return userDao.modifyUser(user);
	}
	
	public int modifyDept(Dept dept) {
		return deptDao.modifyDept(dept);
	}
	
	public int modifyClub(Club club) {
		return clubDao.modifyClub(club);
	}
}
