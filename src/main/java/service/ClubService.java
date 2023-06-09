package service;

import java.util.List;

import model.Club;

public interface ClubService {

	public int insertClub(Club club);
	
	public List<String> getAllClubNames();
	
	public List<Club> getAllowedClubNames();
	
	public List<Club> getCommonClubNames();
	
	public List<Club> getCommonClubNames(String userId);
	
	public List<Club> getMajorClubNames(String userId);
	
	public Club getClubNamesByNum(String clubId);
	
	public Club getClubByManagerId(String managerId);
	
	public String getClubIdByName(String clubName);
	
	public List<Club> getAllClubs();

	public String getClubsCountByManagerId(String managerId);
	
	public String getAllClubByCreatingClub(String clubName);
	
	public boolean existsClubUsers(String clubId);
}
