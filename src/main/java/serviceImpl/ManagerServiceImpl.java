package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ManagerDao;
import model.ClubUser;
import service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	ManagerDao managerDao;
	
	public List<ClubUser> getAllClubUsers() {
		return managerDao.getAllClubUsers();
	}
}
