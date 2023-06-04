package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Club;
import model.Dept;
import model.User;

import service.ClubService;
import service.ClubUsersService;
import service.DeptService;

@Controller
public class IndexController {
	@Autowired
	private DeptService deptService;
	@Autowired
	private ClubService clubService;
	@Autowired
	private ClubUsersService clubUsersService;
	
	private List<Club> clubsForSignIn;

	@RequestMapping("/home")
	public ModelAndView mainPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		User userInfo = (User)request.getSession().getAttribute("SESSION");
		
		if(clubUsersService.checkMajorSigned(userInfo.getUserId()) == null) {
			clubsForSignIn = clubService.getAllowedClubNames();
		}
		else {
			clubsForSignIn = clubService.getCommonClubNames(userInfo.getUserId());	// 본인이 가입된 일반 동아리를 제외한 목록
		}
		
		List<Dept> depts = deptService.getAllDeparts();
		List<Club> clubs = clubService.getAllClubs();
		
		mav.addObject("depts", depts);
		mav.addObject("clubs", clubs);
		mav.addObject("clubsForSignIn", clubsForSignIn);
		mav.addObject("userInfo", userInfo);
		
		mav.setViewName("home");
		return mav;
	}
}