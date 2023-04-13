package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Club;

@Controller
public class PostController {
	
	@RequestMapping("/viewpost")
	public ModelAndView viewpost(@RequestParam("id") String postId) {
		ModelAndView mav = new ModelAndView();  

		mav.addObject("postObj", postId);

		mav.setViewName("post");
		return mav;
	}
}
