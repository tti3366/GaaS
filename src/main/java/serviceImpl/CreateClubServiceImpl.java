package serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import dao.ClubDao;
import model.Club;
import service.CreateClubService;

public class CreateClubServiceImpl implements CreateClubService {
		
	@Autowired
	ClubDao clubDao;
	
	@Override
	public int insertClub(Club club) {
		return clubDao.insertClub(club);
	}

}
