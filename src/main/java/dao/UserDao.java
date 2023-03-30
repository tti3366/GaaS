package dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import model.User;

//db접근하는 클래스
//오라클에 맞게 수정하면 될듯
public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	//회원 가입
	public int insertUser(User user) {
		System.out.println("insertUser");
		String sql="insert into member values(?,?,?,?,?)";
		
		int result=jdbcTemplate.update(sql,Integer.parseInt(user.getUserId()),user.getUserPw(),user.getUserName(),user.getUserEmail(),user.getUserPhoneNumber());
		return result;
	}
	
	//모든 사용자
	public void selectAllUser() {
		System.out.println("selectAllUser");
		String sql="select * from member";
		
		List<User> results=jdbcTemplate.query(sql,
				
				(ResultSet rs,int rowNum)->{
					User user=new User();
					//user.setUserId(rs.getString("user_id"));
					//user.setUserPw(rs.getString("user_pw"));
					return user;
				});

		for(User user: results) {
			//System.out.println(user.getUserId());
			System.out.println(user.getUserPw());
		}
	}
	
	//아이디 비밀번호에 맞는 사용자 있는지 
	public User selectUser(User user)throws Exception{
		System.out.println("selectUser");
		String sql="select * from member where member_id=? and password=?";
		
		User result=jdbcTemplate.queryForObject(sql,
				(ResultSet rs,int rowNum)->{
					User userInfo=new User();
					userInfo.setUserId(String.valueOf(rs.getInt("member_id")));
					userInfo.setUserPw(rs.getString("password"));
					userInfo.setUserName(rs.getString("name"));
					userInfo.setUserEmail(rs.getString("email"));
					userInfo.setUserPhoneNumber(rs.getString("phone_number"));
					return userInfo;
				},
				Integer.parseInt(user.getUserId()),user.getUserPw());
		
		return result;
		
		
	}
	
	
	//사용자가 가입한 동아리 있는지
	public List<String> selectClub(String userId) {
		System.out.println("selectClub");
		
		String sql="select club_name "
				+ "from club "
				+ "where club_id in "
				+ "(select club_id "
				+ "from member,club_member "
				+ "where member.member_id=club_member.member_id and member.member_id=?)";
		
		
		List<String> result=jdbcTemplate.query(sql,
				(ResultSet rs, int rowNumb)->{
					return rs.getString("club_name");
				},userId);
			
		return result;
	}
	
}
