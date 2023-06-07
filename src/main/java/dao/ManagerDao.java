package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.ClubUsers;
import model.User;

public class ManagerDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private RowMapper<ClubUsers> rowMapper = BeanPropertyRowMapper.newInstance(ClubUsers.class);
	
	private ClubUsers clubUsers;
	
	public List<ClubUsers> getAllClubUsers() {
		String sql = "SELECT cu.*, u.user_name, u.user_phone_number, d.name_kr as \"dept_name_kr\" " 
					+ "FROM club_users cu, users u, dept d " 
					+ "WHERE cu.user_id = u.user_id AND d.dept_id = substr(u.user_id, 4, 2) "
					+ "ORDER BY JOIN_DATE ASC";
		
		return jdbcTemplate.query(sql, rowMapper);
	}
	
	public List<ClubUsers> getClubUsersByManagerId(String managerId) {
		String sql = "SELECT cu.*, u.user_name, u.user_phone_number, d.name_kr as \"dept_name_kr\" " 
					+ "FROM club_users cu, users u, dept d " 
					+ "WHERE cu.club_id = (select club_id from club where manager_id = ?) "
					+ "AND cu.user_id = u.user_id AND d.dept_id = substr(u.user_id, 4, 2) "
					+ "ORDER BY JOIN_DATE ASC";
		
		return jdbcTemplate.query(sql, rowMapper, managerId);
	}
	
	public int modifyClubUser(ClubUsers clubUsers) {
		String sql = "UPDATE club_users SET allow_state = ? where user_id = ? and club_id = ?";
		
		int userId = clubUsers.getUserId();
		String clubId = clubUsers.getClubId();
		
		int result = jdbcTemplate.update(sql, clubUsers.getAllowState(), userId, clubId);

		return result;
	}
}
