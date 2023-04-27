package serviceImpl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ClubDao;
import dao.DeptDao;
import dao.UserDao;
import service.ManageService;

@Service
public class ManageServiceImpl implements ManageService {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	ClubDao clubDao;
	
	@Autowired
	DeptDao deptDao;
	
	public Map<String, Object> getAllTables() {
		Map<String, Object> map = new HashMap<>();
		
		map.put("users", userDao.getAllUsers());
		map.put("clubs", clubDao.getAllClubs());
		map.put("depts", deptDao.getAllDeparts());
		return map;
	}
}
