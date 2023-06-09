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
	
	public List<Club> getAllowedClubNames() {
		return clubDao.getAllowedClubNames();
	}
	
	public List<Club> getCommonClubNames() {
		return clubDao.getCommonClubNames();
	}
	
	public List<Club> getCommonClubNames(String userId) {
		return clubDao.getCommonClubNames(userId);
	}
	
	public List<Club> getMajorClubNames(String userId) {
		return clubDao.getMajorClubNames(userId);
	}
	
	public Club getClubNamesByNum(String clubId) {
		return clubDao.getClubNamesByNum(clubId);
	}
	
	public Club getClubByManagerId(String managerId) {
		return clubDao.getClubByManagerId(managerId);
	}
	
	public String getClubIdByName(String clubName) {
		return clubDao.getClubIdByName(clubName);
	}
	
	public List<Club> getAllClubs() {
		return clubDao.getAllClubs();
	}

	public String getClubsCountByManagerId(String managerId) {
		return clubDao.getClubsCountByManagerId(managerId);
	}

	public String getAllClubByCreatingClub(String clubName) {
		return clubDao.getAllClubByCreatingClub(clubName);
	}
	
	public boolean existsClubUsers(String clubId) {
		return clubDao.existsClubUsers(clubId);
	}
}
