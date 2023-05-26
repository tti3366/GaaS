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
	
	public int insertPost(Post post) {
		
		String sql="";
		int result=0;
		
		String seq = "SELECT post_id_seq.NEXTVAL FROM dual";//시퀀스를 사용해서 자동적으로 숫자 증가하도록
		long post_id=jdbcTemplate.queryForObject(seq, Long.class);
		
		if(post.getFileName()!=null) {//첨부된 파일이 있으면
			sql = "INSERT INTO POST2(post_id,writer_id,club_id,board_id,title,contents,post_date,status_code,file_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			result = jdbcTemplate.update(sql,post_id,post.getWriterId(),post.getClubId(),
					post.getBoardId(),post.getTitle(),post.getContent(),post.getPostDate(),post.getStatusCode(),post.getFileName());

		}else {//첨부된 파일이 없으면
			sql = "INSERT INTO POST2(post_id,writer_id,club_id,board_id,title,contents,post_date,status_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			result = jdbcTemplate.update(sql,post_id,post.getWriterId(),post.getClubId(),
					post.getBoardId(),post.getTitle(),post.getContent(),post.getPostDate(),post.getStatusCode());
		}

		return result;
	}
}
