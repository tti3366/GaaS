package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import model.Club;

public class ClubDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int intsertClub(Club club) {
		System.out.println("insertClub");
		String sql="insert into club values(?,?,?,?)";
		
		int result=jdbcTemplate.update(sql,String.valueOf(++Club.clubId),club.getManagerId(),club.getClubName(),club.getDivision());
		return result;
	}
}
