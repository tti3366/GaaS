package serviceImpl;

import java.util.List;

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
	
	public List<String> getAllClubNames() {
		return clubDao.getAllClubNames();
	}
	
	public Club getClubNamesByNum(String clubId) {
		return clubDao.getClubNamesByNum(clubId);
	}
	
	public List<Club> getAllClubs() {
		return clubDao.getAllClubs();
	}
}
