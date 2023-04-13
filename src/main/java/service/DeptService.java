package service;

import java.util.List;

import model.Dept;

public interface DeptService {
	
	public List<Dept> getAllDeparts();

	public Dept getDepartsByUserId(String userId);
}
