package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.User;
import service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	//로그인 페이지
	@RequestMapping("/login")
	public String loginPage() {
		//return "/WEB-INF/view/Login";
		System.out.println("aa");
		return "login";
	}
	
	//회원가입 페이지
	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	
	//회원가입
	@RequestMapping("/signUpCheck")
	public String signUpCheck(@ModelAttribute("signupTest") User user) {
		
		int result=loginService.insertUser(user);
		System.out.println(result);
		return "success_signup";
	}

	//사용자가 입력한 아이디와 비밀번호를 받아 커맨드 객체로 생성
	//검증 필요?
	@PostMapping("/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute("test") User user) {
		
		ModelAndView mav=new ModelAndView();
		
		//사용자가 입력한 id,pw에 맞는 db정보가 있는지 확인(로그인 정보 확인)
		try {
			User result=loginService.selectUser(user);
			
			System.out.println(result.getUserId());
			System.out.println(result.getUserPw());
			
			
			//사용자가 가입한 동아리가 있는지
			List<String> clubName=loginService.selectClub(result.getUserId());//학번을 이용해 가입한 동아리의 이름을 가져옴
				
			System.out.println(clubName);
			mav.addObject("userInfo",result);
			mav.addObject("club",clubName);
			mav.setViewName("main");
			
			return mav;
			
			
			
		}catch(Exception e) {//아이디나 비밀번호가 달라 예외가 발생한 경우 다시 로그인 페이지로 리다이렉트(틀렸다는 메세지가 필요할 듯)
			//return "redirect:/login";
			System.out.println("redirect");
			mav.setViewName("redirect:/login");
			return mav;
		}
	}
}

