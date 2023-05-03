package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.Club;
import model.Dept;

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
	
	public String getAllClubByCreatingClub(String clubName) {
		String sql = "SELECT COUNT(*) FROM club WHERE LOWER(club_name) = LOWER(?)";
		
		return jdbcTemplate.queryForObject(sql, String.class ,clubName);
	}

	// 동아리 코드로 동아리 정보 조회
	public Club getClubNamesByNum(String clubId) {
		try {
			/*
			 * 동아리 추가 페이지 생성 이전 테스트 용으로, 동아리 구분 코드만 활용한 코드 일부
			 * 
			 * String id = clubId.substring(0, 2); // 동아리 코드 
			 * String sql = "SELECT * FROM CLUB WHERE club_id LIKE ?"; 
			 * String param = id + "%";
			 * club = jdbcTemplate.queryForObject(sql, rowMapper, param);
			 */	
			String sql = "SELECT * FROM CLUB WHERE club_id LIKE ?";
			
			club = jdbcTemplate.queryForObject(sql, rowMapper, clubId);
		} catch (NullPointerException e) {
			System.out.println("[동아리] 일치하는 데이터가 없습니다.");
		}
		return club;
	}
	
	public List<Club> getAllClubs() {
		String sql = "SELECT * FROM CLUB";
		
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
}
