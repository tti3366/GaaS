package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.effectException;
import model.User;
import pattern.ManagerState;
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
	
	SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date date = new Date(System.currentTimeMillis());
	
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
			//유효성 검사
			String pattern = "2\\d{2}(10|20|30|44|60|71)\\d{3}";//아이디 정규표현식
			boolean effect=Pattern.matches(pattern, user.getUserId());
			System.out.println(formatter.format(date) + " [SIGNUP] VALIDATE : " + effect);
			
			if(effect) {//유효성 검사 성공
				loginService.insertUser(user);
				System.out.println(formatter.format(date) + " [SIGNUP] SUCCESS");
			
				String alert = "<script>alert('회원가입에 성공하였습니다.');</script>";
				mav.addObject("alert", alert);
				mav.setViewName("login");
			
			}else {//유효성 검사 실패
				throw new effectException("유효성 검사 실패");
			}
			
			return mav;
		}catch(effectException e) {//유효성 검사 예외
			System.out.println(formatter.format(date) + " [SIGNUP] EXCEPTION");
			
			String alert = "<script>alert('아이디 형식에 맞지 않습니다.\\n(2xx[10|20|30|44|60|71]xxx)');</script>";
			
			mav.addObject("alert", alert);
			mav.setViewName("login");
			return mav;
		}catch(Exception e) {
			
			System.out.println(formatter.format(date) + " [SIGNUP] EXCEPTION");
			
			String alert = "<script>alert('중복된 학번이 있습니다.');</script>";
			
			mav.addObject("alert", alert);
			mav.setViewName("login");
			return mav;
		}
	}

	//사용자가 입력한 아이디와 비밀번호를 받아 커맨드 객체로 생성
	@PostMapping(value = "/loginProc")
	public ModelAndView loginProc(@ModelAttribute("loginData") User user, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		try {
			User userInfo = loginService.selectUser(user);
			
			System.out.println(formatter.format(date) + " [LOGIN] TRY ► " + user.getUserId() + " / " + user.getUserPw());
			session.setAttribute("SESSION", userInfo);	// 로그인 유저 Session 등록
			session.setAttribute("First", "true");
			
			System.out.println(formatter.format(date) + " [LOGIN] SUCCESS ► " + userInfo.getUserName() + "(" + userInfo.getUserId()+ ")");
			mav.setViewName("redirect:/home");
			
			return mav;
		} catch(Exception e) {
			System.out.println(formatter.format(date) + " [LOGIN] EXCEPTION");
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
		User user = (User)session.getAttribute("SESSION");
		System.out.println(formatter.format(date) + " [LOGOUT] " + user.getUserName() + "(" + user.getUserId() + ")");
		
		session.invalidate();
		return "redirect:/home";
	}
  
}

