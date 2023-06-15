package dao;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import model.Post;
import model.Reply;

public class ReplyDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insertReply(Reply reply) {
		String sql="INSERT INTO REPLY VALUES(?,?,?,?,?,?)";
		
		String seq = "SELECT reply_id_seq.NEXTVAL FROM dual";//시퀀스를 사용해서 자동적으로 숫자 증가하도록
		long reply_id=jdbcTemplate.queryForObject(seq, Long.class);
		
		return jdbcTemplate.update(sql,reply_id,reply.getWriterId(),reply.getPostId(),
				reply.getContents(),reply.getReplyDate(),reply.getStatusCode());

	}
	
	public List<Reply> selectReply(int postId){
		String sql="SELECT * FROM REPLY WHERE POST_ID=?";

		List<Reply> result=jdbcTemplate.query(sql,
							(ResultSet rs,int rowNum)->{
								Reply r=new Reply();
								r.setReplyId(rs.getInt("reply_id"));
								r.setWriterId(rs.getInt("writer_id"));
								r.setPostId(rs.getInt("post_id"));
								r.setContents(rs.getString("contents"));
								r.setReplyDate(rs.getTimestamp("reply_date"));
								r.setStatusCode(rs.getInt("status_code"));
								return r;
							},postId); 
		return result;
		
	}
	
	public int updateReply(int replyId,String content) {
		String sql="UPDATE REPLY SET CONTENTS=? WHERE REPLY_ID=?";
		
		return jdbcTemplate.update(sql,content,replyId);
	
	}
	
	public int deleteReply(int replyId) {
		String sql="DELETE FROM REPLY WHERE REPLY_ID=?";
		
		return jdbcTemplate.update(sql,replyId);
	}
}