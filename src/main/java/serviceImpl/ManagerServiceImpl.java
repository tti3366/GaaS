package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ManagerDao;
import model.ClubUsers;
import service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	ManagerDao managerDao;
	
	public List<ClubUsers> getAllClubUsers() {
		return managerDao.getAllClubUsers();
	}
	
	public List<ClubUsers> getClubUsersByManagerId(String managerId) {
		return managerDao.getClubUsersByManagerId(managerId);
	}
	
	public int modifyClubUsers(ClubUsers clubUsers) {
		return managerDao.modifyClubUser(clubUsers);
	}
}
