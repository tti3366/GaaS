package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.ReplyDao;
import model.Reply;
import service.ReplyService;

public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public int insertReply(Reply reply) {
		return replyDao.insertReply(reply);
	}
	
	@Override
	public List<Reply> selectReply(int postId){
		return replyDao.selectReply(postId);
	}
	
	@Override
	public int updateReply(int replyId,String content) {
		return replyDao.updateReply(replyId,content);
	}
	
	@Override
	public int deleteReply(int replyId) {
		return replyDao.deleteReply(replyId);
	}
}