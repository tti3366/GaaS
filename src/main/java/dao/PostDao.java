package dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import model.Post;
import model.User;

public class PostDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Post> selectAllPost() {
		System.out.println("selectAllPost");
		String sql="SELECT * FROM POST";
		
		List<Post> results=jdbcTemplate.query(sql,
				(ResultSet rs,int rowNum)->{
					Post post=new Post();
					return post;
				});

		for(Post post: results) {
			System.out.println(post.getPostId());
		}
		
		return results;
	}
}
