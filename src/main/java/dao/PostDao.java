package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.Post;

public class PostDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	private BeanPropertyRowMapper<Post> rowMapper = new BeanPropertyRowMapper<>(Post.class);
	
	public List<Post> selectAllPost() {
		String sql = "SELECT * FROM POST";
		
		return jdbcTemplate.query(sql, rowMapper);
	}
}
