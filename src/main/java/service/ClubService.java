package service;

import java.util.List;

import model.Club;

public interface ClubService {

	public int insertClub(Club club);
	
	public List<String> getAllClubNames();
	
	public List<Club> getAllowedClubNames();
	
	public List<String> getCommonClubNames();
	
	public Club getClubNamesByNum(String clubId);
	
	public String getClubIdByName(String clubName);
	
	public List<Club> getAllClubs();

	public String getClubsCountByManagerId(String managerId);
	
	public String getAllClubByCreatingClub(String clubName);
	
}
