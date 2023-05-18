package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import model.Club;
import model.Dept;
import model.User;
import service.ClubService;
import service.DeptService;
import service.LoginService;
import service.UserCRUDService;

@Controller
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	
	@Autowired
	private DeptService deptService;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private UserCRUDService userCRUDService;
	
	@RequestMapping("/createclub")
	public ModelAndView createClub(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		ModelAndView mav = new ModelAndView();
		User userInfo = (User) request.getSession().getAttribute("SESSION");
		
		if(userInfo.getAuthority().equals("admin")) {
			String alert = "<script>alert('당신은 이미 동아리장입니다.'); window.close();</script>";
			redirectAttributes.addFlashAttribute("alert", alert);
			
			RedirectView redirectView = new RedirectView("/mypage");
			redirectView.setExposeModelAttributes(false);
			mav.setView(redirectView);
		}else {
			mav.addObject("userInfo",userInfo);
			mav.setViewName("createclub");
		}
		
		return mav;
	}
	
	@PostMapping("/enrollclub")
	public ModelAndView enrollclub(@ModelAttribute("createClub") Club club, HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttributes) {
		ModelAndView mav = new ModelAndView();
		User userInfo = (User) request.getSession().getAttribute("SESSION");
		
		club.setManagerId(userInfo.getUserId());
		if(clubService.getAllClubByCreatingClub(club.getClubName()).equals("0")) {	// 동일한 이름의 동아리 존재 여부 (0 = 없음, 1 = 있음)
			if(club.getDivision().equals("전공")) {
				String tempId = userInfo.getUserId().substring(3, 5).equals("71")?"00060000":userInfo.getUserId();
				Dept dept = deptService.getDepartsByUserId(tempId);
				String num = clubService.getClubsCountByManagerId(tempId);
				String clubId = tempId.substring(3, 5)+"_"+num;
				club.setClubId(clubId);
				club.setDeptNameEn(dept.getNameEn());
				club.setDeptNameKr(dept.getNameKr());
			}else {
				String num = clubService.getClubsCountByManagerId("00099000");
				String clubId = "99_"+num;
				club.setClubId(clubId);
				club.setDeptNameEn("Common");
				club.setDeptNameKr("일반");
			}
			
			System.out.println(club.toString());
			int result=clubService.insertClub(club);
			
			if(result == 1) {
				userInfo = loginService.selectUserByUserId(userInfo.getUserId());
				userInfo.setAuthority("manager");
				userCRUDService.updateUserAuthority(userInfo);
				session.setAttribute("SESSION", userInfo);
				
				String alert = "<script>alert('Insert Success!'); window.close();</script>";
				redirectAttributes.addFlashAttribute("alert", alert);
				
				RedirectView redirectView = new RedirectView("/mypage");
				redirectView.setExposeModelAttributes(false);
				mav.setView(redirectView);
			}else {
				String alert = "<script>alert('Insert Failure.'); window.close();</script>";
				redirectAttributes.addFlashAttribute("alert", alert);
				
				RedirectView redirectView = new RedirectView("/mypage");
				redirectView.setExposeModelAttributes(false);
				mav.setView(redirectView);
			}
		}else {
			String alert = "<script>alert('동일한 이름의 동아리가 있습니다.'); window.close();</script>";
			redirectAttributes.addFlashAttribute("alert", alert);
			
			RedirectView redirectView = new RedirectView("/mypage");
			redirectView.setExposeModelAttributes(false);
			mav.setView(redirectView);
		}
		
		return mav;
	}
	
	@RequestMapping("/viewclub")
	public ModelAndView viewclub(@RequestParam("id") String clubId) {
		ModelAndView mav = new ModelAndView();  
		
		Club club = clubService.getClubNamesByNum(clubId);

		mav.addObject("clubObj", club);

		mav.setViewName("club");
		return mav;
	}
}
