package service;

import java.util.List;

import model.ClubUsers;

public interface ClubUsersService {
	
	public List<ClubUsers> getClubUserByNum(String userId);
	
	public int insertClub(ClubUsers clubUser);
	
	public ClubUsers checkSignedById(String clubId, String userId);
	
	public ClubUsers checkMajorSigned(String userId);

	public boolean checkClubAuth(String userId, String clubId);
}
