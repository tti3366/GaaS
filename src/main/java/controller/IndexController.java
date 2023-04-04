package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.User;
import service.ClubService;

@Controller
public class IndexController {

	@Autowired
	private ClubService clubService;

	@RequestMapping("/home")
	public ModelAndView getClubList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		User userInfo = (User)request.getSession().getAttribute("SESSION");
		
		List<String> clubSW = clubService.getClubNamesByNum(1);//동아리id가 1로 시작하는 동아리 -> 추후에 실제 학과번호에 맞춰서 수정해야함
		
		mav.addObject("userInfo", userInfo);
		mav.addObject("clubSW", clubSW);
		mav.setViewName("home");
		
		return mav;
	}
}