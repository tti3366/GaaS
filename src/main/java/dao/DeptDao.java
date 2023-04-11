package dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.Department;
import model.User;

public class DeptDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Department> getAllDepartments() {
		String sql = "SELECT * FROM department";
        RowMapper<Department> rowMapper = (rs, rowNum) -> {
            Department department = new Department();
            department.setDeptId(rs.getString("dept_id"));
            department.setNameKr(rs.getString("name_kr"));
            department.setNameEn(rs.getString("name_en"));
            return department;
        };
        return jdbcTemplate.query(sql, rowMapper);
	}
	
	public Department getDepartmentsByUserId(String userId) {
		String sql="select * from department where DEPT_ID =?";
		
		Department result=jdbcTemplate.queryForObject(sql,
				(ResultSet rs,int rowNum)->{
					Department deptInfo = new Department();
					deptInfo.setDeptId(rs.getString("DEPT_ID"));
					deptInfo.setNameKr(rs.getString("NAME_KR"));
					deptInfo.setNameEn(rs.getString("NAME_EN"));
					return deptInfo;
				},userId.substring(3, 5));
		
		return result;
	}

}