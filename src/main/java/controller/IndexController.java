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
import model.Department;
import model.User;

import service.ClubService;
import service.DeptService;

@Controller
public class IndexController {
	@Autowired
	private DeptService deptService;
	@Autowired
	private ClubService clubService;

	@RequestMapping("/home")
	public ModelAndView mainPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		User userInfo = (User)request.getSession().getAttribute("SESSION");
		
		List<Department> depts = deptService.getAllDepartments();
		List<Club> clubs = clubService.getAllClubs();
		
		mav.addObject("depts", depts);
		mav.addObject("clubs", clubs);
		mav.addObject("userInfo", userInfo);
		
		mav.setViewName("home");
		return mav;
	}

	@RequestMapping("/test")
	public ModelAndView testA(@RequestParam("id") String clubId) {
		ModelAndView mav = new ModelAndView();  
		
		Club club = clubService.getClubNamesByNum(clubId);

		mav.addObject("clubObj", club);

		mav.setViewName("test");
		return mav;
	}
}