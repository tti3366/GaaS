package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.ClubUser;

public class ManagerDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private RowMapper<ClubUser> rowMapper = BeanPropertyRowMapper.newInstance(ClubUser.class);
	
	private ClubUser clubUser;
	
	public List<ClubUser> getAllClubUsers() {
		String sql = "SELECT cu.*, u.user_name, u.user_phone_number, d.name_kr as \"dept_name_kr\" " 
					+ "FROM club_users cu, users u, dept d " 
					+ "WHERE cu.user_id = u.user_id AND d.dept_id = substr(u.user_id, 4, 2)";
		
		return jdbcTemplate.query(sql, rowMapper);
	}
}
