package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.DeptDao;
import model.Department;
import service.DeptService;

public class DeptServiceImpl implements DeptService {
	
	@Autowired
	DeptDao deptDao;
	
	public List<Department> getAllDepartments() {
		return deptDao.getAllDepartments();
	}

}
