package controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Reply;
import model.User;
import service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date date = new Date(System.currentTimeMillis());
	
	//댓글 작성
	@ResponseBody
	@PostMapping("/comments")
	public String comments(@ModelAttribute("Reply") Reply reply, HttpSession session) {
		User userInfo = (User) session.getAttribute("SESSION");
		
		reply.setWriterId(Integer.parseInt(userInfo.getUserId()));
		reply.setReplyDate(new Timestamp(System.currentTimeMillis()));
		
		int result = replyService.insertReply(reply);
		
		if(result > 0) {
			System.out.println(formatter.format(date) + " [" + userInfo.getUserName() + "(" + userInfo.getUserId() + ")]님이 " + reply.getPostId() + "번 게시글에 댓글을 작성했습니다.");
			return "write reply success";
		}
		else
			return "write reply failure";
	}
	
	@RequestMapping("/allcomments")
	public ModelAndView allcomments(@RequestParam("id") int postId, HttpSession session) {
		List<Reply> results = replyService.selectReply(postId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("replies", results);
		mav.addObject("userInfo", session.getAttribute("SESSION"));
		mav.setViewName("viewallreply");
		
		return mav;
	}
	
	@PostMapping("/updatereply")
	@ResponseBody
	public String updateReply(@RequestParam("id") int replyId, @RequestParam("content") String content, HttpSession session) {
		User userInfo = (User) session.getAttribute("SESSION");
		
		int result = replyService.updateReply(replyId, content);
		
		if(result > 0) {
			System.out.println(formatter.format(date) + " [" + userInfo.getUserName() + "(" + userInfo.getUserId() + ")]님이 " + replyId + "번 댓글을 수정했습니다.");
			return "update reply success";
		}
		else
			return "update reply failure";
	}
	
	@PostMapping("/deletereply")
	@ResponseBody
	public String deleteReply(@RequestParam("id") int replyId, HttpSession session) {
		User userInfo = (User) session.getAttribute("SESSION");
		
		int result = replyService.deleteReply(replyId);
		
		if(result > 0) {
			System.out.println(formatter.format(date) + " [" + userInfo.getUserName() + "(" + userInfo.getUserId() + ")]님이 " + replyId + "번 댓글을 삭제했습니다.");
			return "delete reply success";
		}
		else
			return "delete reply failure";
	}
}