package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import model.Club;

public class ClubDao {
	 
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//동아리 개설, 동아리 테이블에 데이터 삽입
	public int insertClub(Club club) {
	    String sql = "INSERT INTO club (clubId, userId, name, division) VALUES (?, ?, ?, ?)";
	    return jdbcTemplate.update(sql, club.getClubId(), club.getUserId(), club.getName(), club.getDivision());
	}
}
