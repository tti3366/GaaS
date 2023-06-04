package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.Club;

public class ClubDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private RowMapper<Club> rowMapper = BeanPropertyRowMapper.newInstance(Club.class);
	
	private Club club;
	
	public int intsertClub(Club club) {		
		String sql = "INSERT INTO club VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		int result = jdbcTemplate.update(sql,club.getClubId(),club.getManagerId(),club.getClubName(),club.getDivision(),
				club.getDeptNameKr(),club.getDeptNameEn(),club.getClubState(),club.getClubInformation());
		
		return result;
	}
	
	// 동아리 테이블에 존재하는 동아리명 전체 조회
	public List<String> getAllClubNames() {
		String sql = "SELECT club_name FROM club";
		
		return jdbcTemplate.queryForList(sql, String.class);
	}
	
	public List<Club> getAllowedClubNames() {
		String sql = "SELECT * FROM club WHERE club_state LIKE ? ORDER BY division DESC";
		
		return jdbcTemplate.query(sql, rowMapper, 1);
	}
	
	//일반 동아리명 전체 조회
	public List<Club> getCommonClubNames() {
		String sql = "SELECT * FROM club WHERE division LIKE ? AND club_state LIKE ?";
		
		return jdbcTemplate.query(sql, rowMapper, "일반", 1);
	}
	
	//일반 동아리명 본인이 가입된 것 이외 조회
	public List<Club> getCommonClubNames(String userId) {
		String sql = "SELECT * FROM club WHERE division LIKE ? AND club_state LIKE ? "
					+ "AND club_id not in (select club_id from club_users where user_id = ?) "
					+ "ORDER BY club_id";
		
		return jdbcTemplate.query(sql, rowMapper, "일반", 1, userId);
	}
		
	public String getAllClubByCreatingClub(String clubName) {
		String sql = "SELECT COUNT(*) FROM club WHERE LOWER(club_name) = LOWER(?)";
		
		return jdbcTemplate.queryForObject(sql, String.class ,clubName);
	}
	
	

	// 동아리 코드로 동아리 정보 조회
	public Club getClubNamesByNum(String clubId) {
		try {
			String sql = "SELECT * FROM CLUB WHERE club_id LIKE ?";
			
			club = jdbcTemplate.queryForObject(sql, rowMapper, clubId);
		} catch (NullPointerException e) {
			System.out.println("[동아리] 일치하는 데이터가 없습니다.");
		}
		return club;
	}
	
	public String getClubIdByName(String clubName) {
		String sql = "SELECT club_id FROM CLUB WHERE club_name LIKE ?";
		
		return jdbcTemplate.queryForObject(sql, String.class ,clubName);
	}
	
	public List<Club> getAllClubs() {
		String sql = "SELECT * FROM CLUB ORDER BY club_id";
		
		return jdbcTemplate.query(sql, rowMapper);
	}
	
	public String getClubsCountByManagerId(String managerId) {
		String sql = "SELECT * FROM club WHERE club_id LIKE ?";
		String param = managerId.substring(3, 5) + "_%";
		
		List<Club> clubs = jdbcTemplate.query(sql, rowMapper, param);
		String result = "";
		if(clubs.size()<10) {
			result = "0" + clubs.size();
		}else {
			result += clubs.size();
		}
		
		return result;
	}
	
	public int modifyClub(Club club) {
		String sql = "UPDATE club SET club_name = ?, club_information= ?, club_state = ? where club_id = ?";
		String param = club.getClubId();
		
		int result = jdbcTemplate.update(sql, club.getClubName(), club.getClubInformation(), club.getClubState(), param);

		return result;
	}
	
	public int deleteClub(String clubId) {
		String sql = "DELETE FROM club WHERE club_id = ?";
		
		int result = jdbcTemplate.update(sql, clubId);

		return result;
	}
	
	public boolean existsClubUsers(String clubId) {
		String sql = "SELECT count(*) FROM club_users where club_id = ?";
	
		int result = jdbcTemplate.queryForObject(sql, Integer.class, clubId); 
		
		if(result != 0) return true;	// 동아리원이 한 명이라도 존재한다는 의미
		else return false;
	}
	
	public boolean existsClubBoard(String clubId) {	// 동아리 게시판 존재 유무
		String sql = "SELECT count(*) FROM club_board where club_id = ?";
		
		int result = jdbcTemplate.queryForObject(sql, Integer.class, clubId); 
		
		if(result != 0) return true;	// 게시판이 한 개 이상 존재함을 의미
		else return false;
	}
	
	public int createClubBoard(String clubId) {		// 동아리 게시판 생성
		Map<String, String> tableNames = new HashMap<String, String>();
		tableNames.put("pub", "PUBLIC");
		tableNames.put("pri", "PRIVATE");
		tableNames.put("qna", "QNA");

		int success = 0;
		
		for(String key : tableNames.keySet()) {
			String sql = "INSERT INTO club_board VALUES (?, ?, ?)";

			int result = jdbcTemplate.update(sql, clubId + "_" + key, clubId, clubId + "_" + tableNames.get(key));
			success += result;
		}

		return success;
	}
}