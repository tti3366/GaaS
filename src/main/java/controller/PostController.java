package controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.Post;
import model.User;
import service.PostService;

@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
//	@RequestMapping("/viewpost")
//	public ModelAndView viewpost(@RequestParam("id") String postId) {
//		ModelAndView mav = new ModelAndView();  
//
//		mav.addObject("postObj", postId);
//
//		mav.setViewName("post");
//		return mav;
//	}
	
	@RequestMapping("/post")
	public ModelAndView post(@RequestParam("boardId") String boardId) {//게시글 작성 페이지로
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("boardId", boardId);
		mav.setViewName("post");
		return mav;
	}
	
	//작성한 내용을 처리
	@PostMapping("/process")
    public String processForm(@ModelAttribute("Post") Post post, @RequestParam(value="image",required=false) MultipartFile file, HttpSession session) {
		
		if (!file.isEmpty()) {//파일 첨부했으면
			System.out.println("파일 있음");
            try {
                // 파일 저장 경로 설정 (서버 경로로 변경)
                
            	String path ="/Users/Jun/Image/";
            	//String path ="C:/GaaSimg/";//이건 제 로컬 경로 입니다.
                String fileName = file.getOriginalFilename();//파일명
                
                //파일명이 겹칠 수 있으므로 파일명 앞이나 뒤에 시간 or 랜덤 숫자를 추가해서 넣는걸로
                File uploadFile = new File(path+fileName);
                
                // 서버에(로컬에) 파일 저장
                file.transferTo(uploadFile);

                post.setFileName(fileName);//첨부된 파일 이름

            } catch (Exception e) {
                // 파일 처리 실패 시 예외 처리
                e.printStackTrace();
            }
        }
		
		User userInfo= (User) session.getAttribute("SESSION");
		post.setWriterId(Integer.parseInt(userInfo.getUserId()));//작성자 id
		
		//동아리코드하고 게시판 코드는 어디서 따와서 합시더~
        post.setClubId(post.getBoardId().substring(0, 5));//동아리 코드
        post.setPostDate(new Timestamp(System.currentTimeMillis()));//날짜
        post.setStatusCode(0);//상태코드

        int result=postService.insertPost(post);
        System.out.println(result);
		
        return "redirect:/home"; // 결과 페이지로 리다이렉트 또는 포워드
    }
	
	@RequestMapping("/viewallpost")
	public ModelAndView viewAllPost(@RequestParam("id") String boardId) {
		
		ModelAndView mav = new ModelAndView();
		
		List<Post> posts = postService.selectAllPostByBoardId(boardId);
		
		Collections.sort(posts, (a, b) -> a.getPostId() - b.getPostId());
		
		//mav.addObject("clubName", clubSer)
		mav.addObject("posts", posts);
		mav.setViewName("viewallpost");
		return mav;
	}
	
	
	@RequestMapping("/viewpost")
	public ModelAndView viewPost(@RequestParam("id") int postId) {
		ModelAndView mav = new ModelAndView();  
		
		Post post=postService.selectPost(postId);
		mav.addObject("postObj",post);
		mav.setViewName("viewpost");

		return mav;
	}
}
