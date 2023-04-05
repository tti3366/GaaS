package service;

import java.util.List;

import model.Club;

public interface ClubService {

	public int insertClub(Club club);
	
	public List<String> getAllClubNames();
	
	public List<String> getClubNamesByNum(int num);
	
	public List<Club> getAllClubs();

}
