package service;

import java.util.List;

import model.Post;
import serviceImpl.PostServiceImpl;

public interface PostService {
	public List<Post> selectAllPost();
	
	public int insertPost(Post post);
}
