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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import model.ChangePwd;
import model.Department;
import model.User;
import service.ClubService;
import service.DeptService;
import service.LoginService;
import service.UserCRUDService;

@Controller
public class MyPageController {

	@Autowired
	private LoginService loginService;
	@Autowired
	private ClubService clubService;
	@Autowired
	private DeptService deptService;
	@Autowired
	private UserCRUDService userCRUDService;

	@RequestMapping("/mypage")
	public ModelAndView myPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User userInfo = (User) request.getSession().getAttribute("SESSION");

		List<String> clubNames = loginService.selectClub(userInfo.getUserId()); // 학번을 이용해 가입한 동아리의 이름을 가져옴
		Department deptByUser = deptService.getDepartmentsByUserId(userInfo.getUserId()); // 학번을 이용하여 학과 정보 추출

		mav.addObject("userInfo", userInfo);
		mav.addObject("deptByUser", deptByUser);
//		mav.addObject("club", clubNames); // 이후에 동아리가 배치가 되면 활성화 합시다. 
		mav.setViewName("mypage");

		return mav;
	}

	@PostMapping(value = "/updateUserProc")
	public ModelAndView updateUserProc(@ModelAttribute("updateUserData") User user, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttributes) {
		ModelAndView mav = new ModelAndView();
		User userInfo = (User) request.getSession().getAttribute("SESSION");
		user.setUserId(userInfo.getUserId());

		try {
			userCRUDService.updateUser(user);

			userInfo = loginService.selectUserByUserId(user.getUserId());

			session.setAttribute("SESSION", userInfo);

			String alert = "";
			alert = "<script>alert('SUCCESS UPDATE USER');</script>";
			redirectAttributes.addFlashAttribute("alert", alert);

			RedirectView redirectView = new RedirectView("/mypage"); // redirect url 설정
			redirectView.setExposeModelAttributes(false);
			mav.setView(redirectView);

			return mav;
		} catch (Exception e) {
			System.out.println("UPDATE USER EXCEPTION");

			String alert = "";
			alert = "<script>alert('UPDATE USER EXCEPTION');</script>";
			redirectAttributes.addFlashAttribute("alert", alert);

			RedirectView redirectView = new RedirectView("/mypage"); // redirect url 설정
			redirectView.setExposeModelAttributes(false);
			mav.setView(redirectView);

			return mav;
		}
	}

	@PostMapping(value = "/changePwProc")
	public ModelAndView changeUserPw(@ModelAttribute("changePw") ChangePwd changePwd, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttributes) {
		ModelAndView mav = new ModelAndView();
		User userInfo = (User) request.getSession().getAttribute("SESSION");

		if (userInfo.getUserPw().equals(changePwd.getCurrentPwd())) {
			if(changePwd.getNewPwd().equals(changePwd.getNewPwdCheck())) {
				try {
					userCRUDService.changePwd(userInfo, changePwd);

					session.setAttribute("SESSION", userInfo);

					String alert = "";
					alert = "<script>alert('SUCCESS CHANGE PASSWORD');</script>";
					redirectAttributes.addFlashAttribute("alert", alert);

					RedirectView redirectView = new RedirectView("/mypage"); // redirect url 설정
					redirectView.setExposeModelAttributes(false);
					mav.setView(redirectView);

					return mav;
				} catch (Exception e) {
					System.out.println("CAHNGE PASSWORD EXCEPTION");

					String alert = "";
					alert = "<script>alert('CAHNGE PASSWORD EXCEPTION');</script>";
					redirectAttributes.addFlashAttribute("alert", alert);

					RedirectView redirectView = new RedirectView("/mypage"); // redirect url 설정
					redirectView.setExposeModelAttributes(false);
					mav.setView(redirectView);

					return mav;
				}
			} else {
				String alert = "";
				alert = "<script>alert('새로운 비밀번호가 서로 다르다요.');</script>";
				redirectAttributes.addFlashAttribute("alert", alert);

				RedirectView redirectView = new RedirectView("/mypage"); // redirect url 설정
				redirectView.setExposeModelAttributes(false);
				mav.setView(redirectView);

				return mav;
			}
		} else {
			String alert = "";
			alert = "<script>alert('현재 비밀번호가 틀렸다요.');</script>";
			redirectAttributes.addFlashAttribute("alert", alert);

			RedirectView redirectView = new RedirectView("/mypage"); // redirect url 설정
			redirectView.setExposeModelAttributes(false);
			mav.setView(redirectView);

			return mav;
		}

	}

}
