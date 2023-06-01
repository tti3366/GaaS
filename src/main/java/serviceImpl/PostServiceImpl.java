package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.PostDao;
import model.Post;
import service.PostService;

public class PostServiceImpl implements PostService {
	
	@Autowired
	PostDao postDao;

	@Override
	public List<Post> selectAllPost() {
		return postDao.selectAllPost();
	}
	@Override
	public List<Post> selectAllPostByBoardId(String boardId) {
		return postDao.selectAllPostByBoardId(boardId);
	}
	@Override
	public Post selectPost(int postId) {
		return postDao.selectPost(postId);
	}
	@Override
	public int insertPost(Post post) {
		return postDao.insertPost(post);
		
	}
	@Override
	public int increaseViews(int postId) {
		return postDao.increaseViews(postId);
	}
}
