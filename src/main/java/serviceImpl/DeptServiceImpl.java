package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.DeptDao;
import model.Dept;
import service.DeptService;

public class DeptServiceImpl implements DeptService {
	
	@Autowired
	DeptDao deptDao;
	
	public List<Dept> getAllDeparts() {
		return deptDao.getAllDeparts();
	}
	
	public Dept getDepartsByUserId(String userId) {
		return deptDao.getDepartsByUserId(userId);
	}
	
}
