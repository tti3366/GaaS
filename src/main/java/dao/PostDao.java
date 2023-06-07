package dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import model.Dept;
import model.Post;
import model.User;

public class PostDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	private RowMapper<Post> rowMapper = BeanPropertyRowMapper.newInstance(Post.class);
	
	public List<Post> selectAllPost() {
		String sql = "SELECT * FROM POST2";
		
		List<Post> result=jdbcTemplate.query(sql,
				(ResultSet rs,int rowNum)->{
					Post p=new Post();
					p.setPostId(rs.getInt("POST_ID"));
					p.setWriterId(rs.getInt("WRITER_ID"));
					p.setClubId(rs.getString("CLUB_ID"));
					p.setBoardId(rs.getString("BOARD_ID"));
					p.setTitle(rs.getString("TITLE"));
					p.setContents(rs.getString("CONTENTS"));
					p.setPostDate(rs.getTimestamp("POST_DATE"));
					p.setStatusCode(rs.getInt("STATUS_CODE"));
					p.setViews(rs.getInt("VIEWS"));
					p.setFileName(rs.getString("FILE_NAME"));

					return p;
				});
		
		return result;
	}
	
	public Post selectPost(int postId) {
		String sql="SELECT * FROM POST2 WHERE POST_ID LIKE ?";
		return jdbcTemplate.queryForObject(sql,
				(ResultSet rs, int rowNum)->{
					Post p=new Post();
					p.setPostId(rs.getInt("POST_ID"));
					p.setWriterId(rs.getInt("WRITER_ID"));
					p.setClubId(rs.getString("CLUB_ID"));
					p.setBoardId(rs.getString("BOARD_ID"));
					p.setTitle(rs.getString("TITLE"));
					p.setContents(rs.getString("CONTENTS"));
					p.setPostDate(rs.getTimestamp("POST_DATE"));
					p.setStatusCode(rs.getInt("STATUS_CODE"));
					p.setViews(rs.getInt("VIEWS"));
					p.setFileName(rs.getString("FILE_NAME"));
					
					return p;
				},postId);
		
	}
	
	public List<Post> selectAllPostByBoardId(String boardId) {	// status_code = (0 초기, 1 수정, 2 삭제)
		String sql = "SELECT p.*, u.user_name as \"writer_name\" FROM POST2 p, USERS u " 
					+ "WHERE p.writer_id = u.user_id and status_code in (0, 1) and board_id LIKE ?";
		
		List<Post> result = jdbcTemplate.query(sql,
				(ResultSet rs,int rowNum)->{
					Post p=new Post();
					p.setPostId(rs.getInt("POST_ID"));
					p.setWriterId(rs.getInt("WRITER_ID"));
					p.setClubId(rs.getString("CLUB_ID"));
					p.setBoardId(rs.getString("BOARD_ID"));
					p.setTitle(rs.getString("TITLE"));
					p.setContents(rs.getString("CONTENTS"));
					p.setPostDate(rs.getTimestamp("POST_DATE"));
					p.setStatusCode(rs.getInt("STATUS_CODE"));
					p.setViews(rs.getInt("VIEWS"));
					p.setFileName(rs.getString("FILE_NAME"));
					p.setWriterName(rs.getString("WRITER_NAME"));

					return p;
				}, boardId);
		return result;
	}
	
	public int insertPost(Post post) {
		
		String sql="";
		int result=0;
		
		String seq = "SELECT post_id_seq.NEXTVAL FROM dual";//시퀀스를 사용해서 자동적으로 숫자 증가하도록
		long post_id=jdbcTemplate.queryForObject(seq, Long.class);
		
		if(post.getFileName()!=null) {//첨부된 파일이 있으면
			sql = "INSERT INTO POST2(post_id,writer_id,club_id,board_id,title,contents,post_date,status_code,file_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			result = jdbcTemplate.update(sql,post_id,post.getWriterId(),post.getClubId(),
					post.getBoardId(),post.getTitle(),post.getContents(),post.getPostDate(),post.getStatusCode(),post.getFileName());

		}else {//첨부된 파일이 없으면
			sql = "INSERT INTO POST2(post_id,writer_id,club_id,board_id,title,contents,post_date,status_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			result = jdbcTemplate.update(sql,post_id,post.getWriterId(),post.getClubId(),
					post.getBoardId(),post.getTitle(),post.getContents(),post.getPostDate(),post.getStatusCode());
		}

		return result;
	}
	
	public int modifyPost(Post post) {
		
		String sql = "UPDATE POST2 SET TITLE = ?, CONTENTS = ?, POST_DATE = ?, STATUS_CODE = ? ";
		int result = 0;
		
		
		if(post.getFileName() != null) { //첨부된 파일이 있으면
			sql += ", FILE_NAME = ? WHERE POST_ID = ?";
			result = jdbcTemplate.update(sql, post.getTitle(),post.getContents(), post.getPostDate(), post.getStatusCode(), post.getFileName(),
						post.getPostId());

		} else {//첨부된 파일이 없으면
			sql += "WHERE POST_ID = ?";
			result = jdbcTemplate.update(sql, post.getTitle(),post.getContents(), post.getPostDate(), post.getStatusCode(),
						post.getPostId());
		}

		return result;
	}
	
	public int deletePost(int postId) {
		
		String sql = "UPDATE POST2 SET STATUS_CODE = 2 WHERE POST_ID = ?";
		int result = 0;
		
		result = jdbcTemplate.update(sql, postId);

		return result;
	}
	
	public int increaseViews(int postId) {
		String sql = "UPDATE post2 SET views = views + 1 where post_id = ?";
		
		int result = jdbcTemplate.update(sql, postId);

		return result;
	}
}
