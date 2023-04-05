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
}
