package pattern;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import model.User;
import service.LoginService;

public class StudentIdLoginStrategy implements LoginStrategy {
	SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date date = new Date(System.currentTimeMillis());

	@Override
	public ModelAndView login(User user, HttpSession session, HttpServletRequest request, LoginService ls) {
		ModelAndView mav = new ModelAndView();
		
		try {
			User userInfo = ls.selectUser(user);
			
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

}
