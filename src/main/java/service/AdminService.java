package service;

import java.util.Map;

import model.Club;
import model.Dept;
import model.User;

public interface AdminService {
	public Map<String, Object> getAllTables();
	
	public int modifyUser(User user);
	public int modifyDept(Dept dept);
	public int modifyClub(Club club);
	
	public boolean deleteClub(String clubId);
}
