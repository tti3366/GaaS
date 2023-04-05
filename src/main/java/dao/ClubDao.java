package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.Club;
import model.Department;

public class ClubDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<String> list;
	public Club club;
	
	public int intsertClub(Club club) {
		System.out.println("insertClub");
		String sql="insert into club values(?,?,?,?,?,?)";
		
		int result=jdbcTemplate.update(sql,club.getClubId(),club.getManagerId(),club.getClubName(),club.getDivision(),club.getDeptNameKr(),club.getDeptNameEn());
		return result;
	}
	//현재 존재하는 동아리를 조회
	public List<String> getAllClubNames() {
		String sql = "SELECT club_name FROM club";
		return jdbcTemplate.queryForList(sql, String.class);
	}

	public Club getClubNamesByNum(String clubId) {
		RowMapper<Club> rowMapper = (rs, rowNum) -> {
            Club club = new Club();
            club.setClubId(rs.getString("club_id"));
            club.setManagerId(rs.getInt("manager_id"));
            club.setClubName(rs.getString("club_name"));
            club.setDivision(rs.getString("division"));
            club.setDeptNameKr(rs.getString("dept_name_kr"));
            club.setDeptNameEn(rs.getString("dept_name_en"));
            return club;
        };
        
		try {
			int id = Integer.parseInt(clubId.substring(0, 2));
			
			String sql = "SELECT * FROM club WHERE club_id LIKE ?";
			String param = id + "%";
			
			club = jdbcTemplate.queryForObject(sql, rowMapper, param);
		} catch (NullPointerException e) {
			System.out.println("일치하는 데이터가 없습니다.");
		}
		return club;
	}
	
	public List<Club> getAllClubs() {
		String sql = "select * from club";
		RowMapper<Club> rowMapper = (rs, rowNum) -> {
            Club club = new Club();
            club.setClubId(rs.getString("club_id"));
            club.setManagerId(rs.getInt("manager_id"));
            club.setClubName(rs.getString("club_name"));
            club.setDivision(rs.getString("division"));
            club.setDeptNameKr(rs.getString("dept_name_kr"));
            club.setDeptNameEn(rs.getString("dept_name_en"));
            return club;
        };
        return jdbcTemplate.query(sql, rowMapper);
	}
}
