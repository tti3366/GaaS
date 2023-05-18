package service;

import java.util.List;

import model.ClubUsers;

public interface ManagerService {
	public List<ClubUsers> getAllClubUsers();
	public List<ClubUsers> getClubUsersByManagerId(String managerId);
	public int modifyClubUsers(ClubUsers clubUsers);
}
