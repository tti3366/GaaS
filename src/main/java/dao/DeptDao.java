package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.Department;

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

}