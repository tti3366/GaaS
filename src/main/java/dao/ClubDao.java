package dao;

import java.util.List;

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
		System.out.println("insertClub");
		
		String sql = "INSERT INTO CLUB VALUES (?, ?, ?, ?, ?, ?)";
		
		int result = jdbcTemplate.update(sql,club.getClubId(),club.getManagerId(),club.getClubName(),club.getDivision(),club.getDeptNameKr(),club.getDeptNameEn());
		return result;
	}
	
	// 동아리 테이블에 존재하는 동아리명 전체 조회
	public List<String> getAllClubNames() {
		String sql = "SELECT club_name FROM CLUB";
		
		return jdbcTemplate.queryForList(sql, String.class);
	}

	// 동아리 코드로 동아리 정보 조회
	public Club getClubNamesByNum(String clubId) {
		try {
			int id = Integer.parseInt(clubId.substring(0, 2));		// 동아리 코드
			
			String sql = "SELECT * FROM CLUB WHERE club_id LIKE ?";
			String param = id + "%";
			
			club = jdbcTemplate.queryForObject(sql, rowMapper, param);
		} catch (NullPointerException e) {
			System.out.println("일치하는 데이터가 없습니다.");
		}
		return club;
	}
	
	public List<Club> getAllClubs() {
		String sql = "SELECT * FROM CLUB";
		
		return jdbcTemplate.query(sql, rowMapper);
	}
}
