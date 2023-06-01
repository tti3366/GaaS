package service;

import java.util.List;

import model.Post;
import serviceImpl.PostServiceImpl;

public interface PostService {
	public List<Post> selectAllPost();
	
	public List<Post> selectAllPostByBoardId(String boardId);

	public Post selectPost(int postId);
	
	public int insertPost(Post post);
	
	public int increaseViews(int postId);
	
}
