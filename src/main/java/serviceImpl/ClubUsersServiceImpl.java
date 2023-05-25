package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.ClubUsersDao;
import model.ClubUsers;
import service.ClubUsersService;

public class ClubUsersServiceImpl implements ClubUsersService {
	
	@Autowired
	ClubUsersDao clubUserDao;

	@Override
	public List<ClubUsers> getClubUserByNum(String userId) {
		return clubUserDao.getClubUserByNum(userId);
	}
	
	@Override
	public int insertClub(ClubUsers clubUser) {
		return clubUserDao.insertClub(clubUser);
	}
	
	@Override
	public ClubUsers checkSignedById(String clubId, String userId) {
		return clubUserDao.checkSignedById(clubId, userId);
	}
	
	@Override
	public ClubUsers checkMajorSigned(String userId) {
		return clubUserDao.checkMajorSigned(userId);
	}

}
