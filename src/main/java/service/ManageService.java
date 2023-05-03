package service;

import java.util.Map;

import model.Club;
import model.Dept;
import model.User;

public interface ManageService {
	public Map<String, Object> getAllTables();
	
	public int modifyUser(User user);
	public int modifyDept(Dept dept);
	public int modifyClub(Club club);
}
