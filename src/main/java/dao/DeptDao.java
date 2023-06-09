package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.ChangePwd;
import model.Dept;
import model.User;

public class DeptDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private RowMapper<Dept> rowMapper = BeanPropertyRowMapper.newInstance(Dept.class);
	
	public List<Dept> getAllDeparts() {
		String sql = "SELECT * FROM DEPT ORDER BY dept_id";
		
        return jdbcTemplate.query(sql, rowMapper);
	}
	
	public Dept getDepartsByUserId(String userId) {
		String sql = "SELECT * FROM DEPT where dept_id = ?";
		String param = userId.substring(3, 5);
		
		/*
		 * dept = jdbcTemplate.queryForObject(sql, (ResultSet rs,int rowNum)->{
		 * Department deptInfo = new Department();
		 * deptInfo.setDeptId(rs.getString("DEPT_ID"));
		 * deptInfo.setNameKr(rs.getString("NAME_KR"));
		 * deptInfo.setNameEn(rs.getString("NAME_EN")); return deptInfo;
		 * },userId.substring(3, 5));
		 */
		
		return jdbcTemplate.queryForObject(sql, rowMapper, param);
	}
	
	public int modifyDept(Dept dept) {
		String sql = "UPDATE dept SET name_kr = ?, name_en = ? where dept_id = ?";
		String param = dept.getDeptId();
		
		int result = jdbcTemplate.update(sql, dept.getNameKr(), dept.getNameEn(), param);

		return result;
	}

}