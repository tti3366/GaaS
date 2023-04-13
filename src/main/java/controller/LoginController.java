package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Club;
import model.Dept;
import model.User;
import service.ClubService;
import service.DeptService;
import service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	@Autowired
	private ClubService clubService;
	@Autowired
	private DeptService deptService;
	
	//로그인 페이지
	@RequestMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	//회원가입 페이지
	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	
	//회원가입
	@RequestMapping("/signupProc")
	public ModelAndView signupProc(@ModelAttribute("signupData") User user) {
		ModelAndView mav = new ModelAndView();
		
		try {
			loginService.insertUser(user);
			System.out.println("SUCCESS SIGNUP");
			
			String alert = "<script>alert('회원가입에 성공하였습니다.');</script>";
			mav.addObject("alert", alert);
			mav.setViewName("login");
			
			return mav;
		} catch(Exception e) {
			System.out.println("LOGIN EXCEPTION");
			
			String alert = "<script>alert('회원가입에 실패했습니다. 유효한 데이터를 입력해주세요.');</script>";
			
			mav.addObject("alert", alert);
			mav.addObject("error", " 중복된 학번이 있습니다.");
			mav.setViewName("signup");
			return mav;
		}
	}

	//사용자가 입력한 아이디와 비밀번호를 받아 커맨드 객체로 생성
	@PostMapping(value = "/loginProc")
	public ModelAndView loginProc(@ModelAttribute("loginData") User user, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		try {
			User userInfo = loginService.selectUser(user);
			
			session.setAttribute("SESSION", userInfo);	// 로그인 유저 Session 등록
			
			System.out.println("SESSION : " + request.getSession().getAttribute("SESSION")
								+ " [" + userInfo.getUserName() + "(" + userInfo.getUserId()+ ")]");
			mav.setViewName("redirect:/home");
			
			return mav;
		} catch(Exception e) {
			System.out.println("LOGIN EXCEPTION");
			String alert = "";
			alert = "<script>alert('로그인에 실패했습니다.');</script>";
			
			mav.addObject("alert", alert);
			mav.addObject("user", user);
			mav.setViewName("login");
			return mav;
		}
	}
	
	@RequestMapping("/logoutProc")
	public String logoutProc(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
  
}

