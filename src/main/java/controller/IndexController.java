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
import pattern.AdminState;
import pattern.ManagerState;
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
		
		//권한에 따라 상태 변경
		if(userInfo.getAuthority().equals("manager")) {
			userInfo.setState(new ManagerState());
		}
		else if(userInfo.getAuthority().equals("admin")) {
			userInfo.setState(new AdminState());
		}
		
		//상태에 맞는 메서드 호출
		String message = userInfo.welcomeMessage();
		
		if(clubUsersService.checkMajorSigned(userInfo.getUserId()) == null) {
			clubsForSignIn = clubService.getMajorClubNames(userInfo.getUserId());	// 전공 동아리 가입된 것이 없을 때, 가입할 수 있는 모든 목록 조회 (전공 코드가 사용자의 전공 코드 / 일반 코드여야 함)
		}
		else {
			clubsForSignIn = clubService.getCommonClubNames(userInfo.getUserId());	// 전공 동아리가 하나 존재할 때, 가입 가능한 일반 동아리 목록만 조회
		}
		
		List<Dept> depts = deptService.getAllDeparts();
		List<Club> clubs = clubService.getAllClubs();
		
		//로그인 경우에만 환영 메세지 add
		if(request.getSession().getAttribute("First") == "true") {
			mav.addObject("message", message);
			request.getSession().setAttribute("First", "false");
		}
		
		mav.addObject("depts", depts);
		mav.addObject("clubs", clubs);
		mav.addObject("clubsForSignIn", clubsForSignIn);
		mav.addObject("userInfo", userInfo);
		
		mav.setViewName("home");
		return mav;
	}
}