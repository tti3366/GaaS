package dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.ChangePwd;
import model.Club;
import model.Dept;
import model.Post;
import model.User;

public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private RowMapper<User> rowMapper = BeanPropertyRowMapper.newInstance(User.class);
	
	private User user;
	
	public List<User> getAllUsers() {
		String sql = "SELECT * FROM USERS";
		
        return jdbcTemplate.query(sql, rowMapper);
	}
	
	// 회원 가입
	public int insertUser(User user) {
		System.out.println("insertUser : " + user.toString());
		
		String sql = "INSERT INTO USERS (user_id, user_pw, user_name, user_email, user_phone_number) VALUES (?, ?, ?, ?, ?)";
		
		int result = jdbcTemplate.update(sql, Integer.parseInt(user.getUserId()), user.getUserPw(), user.getUserName(), user.getUserEmail(), user.getUserPhoneNumber());
		
		return result;
	}
	
	// 로그인 
	public User selectUser(User user) throws Exception{
		System.out.println("selectUser : " + user.toString());
		
		String sql = "SELECT * FROM USERS where user_id = ? AND user_pw = ?";
    
		user = jdbcTemplate.queryForObject(sql, rowMapper, Integer.parseInt(user.getUserId()), user.getUserPw());
    
		return user;
	}
	
	public User selectUserByUserId(String userId) {
		String sql = "SELECT * FROM USERS where user_id = ?";
		
		try {
			user = jdbcTemplate.queryForObject(sql, rowMapper, userId);
			return user;					
		} catch (NullPointerException e) {
			return null;
		}
	}
	
	
	// 사용자가 가입한 동아리 있는 지
	public List<String> selectClub(String userId) {		
		String sql = "SELECT club_name FROM CLUB where club_id IN "
						+ "(SELECT club_id FROM USERS, CLUB_USERS "
						+ "where USERS.user_id = CLUB_USERS.user_id AND USERS.user_id = ?)";
		
		return jdbcTemplate.query(
				sql,
				(ResultSet rs, int rowNumb)->{ return rs.getString("club_name"); },
				userId);
	}
	
	public int updateUser(User user) {
		String sql = "UPDATE USERS SET user_phone_number = ?, user_email = ?, about = ? where user_id = ? ";
		int result = jdbcTemplate.update(sql, user.getUserPhoneNumber(), user.getUserEmail(), user.getAbout(), user.getUserId());
		
		return result;
	}
	
	public int changePwd(User user, ChangePwd changePwd) {
		String sql = "UPDATE USERS SET user_pw = ? where user_id = ? ";
		int result = jdbcTemplate.update(sql, changePwd.getNewPwd(), user.getUserId());
		
		return result;
	}
	
	public int deleteUsers(User user) {
		String sql = "DELETE FROM users WHERE user_id = ? ";
		int result = jdbcTemplate.update(sql, user.getUserId());
		
		return result;
	}
}