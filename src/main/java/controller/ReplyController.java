package controller;

import java.sql.Timestamp;
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
	
	//댓글 작성
	@ResponseBody
	@PostMapping("/comments")
	public String comments(@ModelAttribute("Reply") Reply reply, HttpSession session) {

		User userInfo = (User) session.getAttribute("SESSION");
		reply.setWriterId(Integer.parseInt(userInfo.getUserId()));
		reply.setReplyDate(new Timestamp(System.currentTimeMillis()));
		int result=replyService.insertReply(reply);
		System.out.println(result);
		
		return "success";
	}
	
	@RequestMapping("/allcomments")
	public ModelAndView allcomments(@RequestParam("id")int postId, HttpSession session) {

		List<Reply> results=replyService.selectReply(postId);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("replies", results);
		mav.addObject("userInfo", session.getAttribute("SESSION"));
		mav.setViewName("viewallreply");
		
		return mav;
	}
	
	@PostMapping("/updatereply")
	@ResponseBody
	public String updateReply(@RequestParam("id")int replyId, @RequestParam("content")String content) {
		int result=replyService.updateReply(replyId,content);
		System.out.println(result);
		
		return "댓글 수정 완료";
	}
	
	@PostMapping("/deletereply")
	@ResponseBody
	public String deleteReply(@RequestParam("id")int replyId) {
		int result=replyService.deleteReply(replyId);
		System.out.println(result);
		
		return "댓글 삭제 완료";
	}
}