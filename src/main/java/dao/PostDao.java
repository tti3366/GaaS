package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.Dept;
import model.Post;

public class PostDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	private RowMapper<Post> rowMapper = BeanPropertyRowMapper.newInstance(Post.class);
	
	public List<Post> selectAllPost() {
		String sql = "SELECT * FROM POST";
		
		return jdbcTemplate.query(sql, rowMapper);
	}
}
