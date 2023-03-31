package serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import dao.ClubDao;
import model.Club;
import service.ClubService;

public class ClubServiceImpl implements ClubService{

	@Autowired
	ClubDao clubDao;
	
	public int insertClub(Club club) {
		return clubDao.intsertClub(club);
	}
}
