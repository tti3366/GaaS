package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.Club;
import model.ClubUsers;

public class ClubUsersDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private RowMapper<ClubUsers> rowMapper = BeanPropertyRowMapper.newInstance(ClubUsers.class);
	
	public List<ClubUsers> getClubUserByNum(String userId) {
		
		try {
			String sql = "SELECT * FROM CLUB_USERS WHERE user_id LIKE ?";
			
			List<ClubUsers> clubUsers = jdbcTemplate.query(sql, rowMapper, userId);
			return clubUsers;
		} catch (EmptyResultDataAccessException e) {
			System.out.println("가입한 전공 동아리가 없습니다.");
			return null;
		}
	}
	
	public int insertClub(ClubUsers clubUser) {		
		String sql = "INSERT INTO club_users VALUES (?, ?, ?, ?, ?, ?)";
		
		int result = jdbcTemplate.update(sql,clubUser.getUserId(),clubUser.getClubId(),clubUser.getJoinDate(),clubUser.getAllowState(),
				clubUser.getIntroduce(), clubUser.getClubName());
		
		return result;
	}
	
	public ClubUsers checkSignedById(String clubId, String userId) {
		try {
			String sql = "SELECT * FROM CLUB_USERS WHERE club_id LIKE ? AND user_id LIKE ?";
		
			ClubUsers clubUser = jdbcTemplate.queryForObject(sql, rowMapper, clubId, userId);
			return clubUser;
		} catch (EmptyResultDataAccessException e) {
			System.out.println("가입한 동아리가 없습니다.");
			return null;
		}	
	}
	
	public ClubUsers checkMajorSigned(String userId) {
		try {
			String sql = "SELECT * FROM CLUB_USERS WHERE SUBSTR(CLUB_ID, 1, 2) <> '99' AND user_id LIKE ?";
			
			ClubUsers clubUser = jdbcTemplate.queryForObject(sql, rowMapper, userId);
			return clubUser;
		} catch (EmptyResultDataAccessException e) {
			System.out.println("가입한 전공 동아리가 없습니다.");
			return null;
		}
	}

}
