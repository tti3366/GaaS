package dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import model.User;

public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private BeanPropertyRowMapper<User> rowMapper =  new BeanPropertyRowMapper<User>();
	
	private User user;
	
	// 회원 가입
	public int insertUser(User user) {
		System.out.println("insertUser : " + user.toString());
		
		String sql = "INSERT INTO USER (user_id, user_pw, user_name, user_email, user_phone_number) VALUES (?, ?, ?, ?, ?)";
		
		int result = jdbcTemplate.update(sql, Integer.parseInt(user.getUserId()),user.getUserPw(),user.getUserName(),user.getUserEmail(),user.getUserPhoneNumber());
		
		return result;
	}
	
	// 로그인 
	public User selectUser(User user) throws Exception{
		System.out.println("selectUser : " + user.toString());
		
		String sql = "SELECT * FROM USER where user_id = ? AND user_pw = ?";
		
		user = jdbcTemplate.queryForObject(sql, rowMapper, Integer.parseInt(user.getUserId()), user.getUserPw());
		
		return user;
	}
	
	public User selectUserByUserId(String userId) {
		String sql = "SELECT * FROM USER where user_id = ?";
		
		try {
			user = jdbcTemplate.queryForObject(sql, rowMapper, userId);
			return user;
					
		} catch (NullPointerException e) {
			return null;
		}
	}
	
	
	// 사용자가 가입한 동아리 있는 지
	public List<String> selectClub(String userId) {
		System.out.println("selectClub");
		
		String sql = "SELECT club_name FROM CLUB where club_id IN "
						+ "(SELECT club_id FROM USER, CLUB_USER "
						+ "where USER.user_id = CLUB_USER.user_id AND USER.user_id = ?)";
		
		return jdbcTemplate.query(
				sql,
				(ResultSet rs, int rowNumb)->{ return rs.getString("club_name"); },
				userId);
	}
	
}
