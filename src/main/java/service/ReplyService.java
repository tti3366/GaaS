package service;

import java.util.List;

import model.Reply;

public interface ReplyService {
	
	public int insertReply(Reply reply);
	
	public List<Reply> selectReply(int postId);
	
	public int updateReply(int replyId, String content);
	
	public int deleteReply(int replyId);
}