package controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

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
import model.ClubUsers;
import model.Dept;
import model.User;
import service.ClubService;
import service.ClubUsersService;
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
	
	@Autowired
	private ClubUsersService clubUsersService;
	
	private List<Club> clubs;
	
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
	
	@RequestMapping("/signinclub")
	public ModelAndView signinclub(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User userInfo = (User) request.getSession().getAttribute("SESSION");
		
		System.out.println(userInfo.getUserId());
		
		if(clubUsersService.checkMajorSigned(userInfo.getUserId()) == null) {
			clubs = clubService.getAllowedClubNames();
		}
		else {
			clubs = clubService.getCommonClubNames();
		}
		
		mav.addObject("clubs", clubs);
		mav.addObject("userInfo", userInfo);
		mav.setViewName("signinclub");
		return mav;
	}
	
	@PostMapping("/enterclub")
	public ModelAndView enterclub(@ModelAttribute("clubUser") ClubUsers clubUser, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		ModelAndView mav = new ModelAndView();
		String clubName = clubUser.getClubName();
		String clubId = clubService.getClubIdByName(clubName);
		System.out.println(clubName);
		System.out.println(clubId);
		User userInfo = (User) request.getSession().getAttribute("SESSION");
		
		//선택한 동아리가 전공 동아리일 경우
		if(!clubId.substring(0, 2).equals("99")) {
			//선택한 동아리가 전공 동아리인데 이미 전공 동아리에 가입한 경우
			if(clubUsersService.checkMajorSigned(userInfo.getUserId()) != null || userInfo.getAuthority() == "manager") {
				String alert = "<script>alert('이미 가입한 전공 동아리가 존재합니다!'); window.close();</script>";
				redirectAttributes.addFlashAttribute("alert", alert);
				
				RedirectView redirectView = new RedirectView("/mypage");
				redirectView.setExposeModelAttributes(false);
				mav.setView(redirectView);
			}
			//전공 동아리 가입을 하지 않은 경우, 테이블에 가입 정보 삽입
			else {
				clubUser.setUserId(Integer.parseInt(userInfo.getUserId()));
				clubUser.setClubId(clubId);
				clubUser.setJoinDate(LocalDateTime.now());
				
				clubUsersService.insertClub(clubUser);
				
				String alert = "<script>alert('가입 신청 완료!'); window.close();</script>";
				redirectAttributes.addFlashAttribute("alert", alert);
				
				RedirectView redirectView = new RedirectView("/mypage");
				redirectView.setExposeModelAttributes(false);
				mav.setView(redirectView);
			}
		}
		//교양 동아리 가입 신청 시, 이미 같은 동아리에 가입이 돼있는 경우
		else if(clubUsersService.checkSignedById(clubId, userInfo.getUserId()) != null) {
			String alert = "<script>alert('이미 가입한 동아리가 존재합니다!'); window.close();</script>";
			redirectAttributes.addFlashAttribute("alert", alert);
			
			RedirectView redirectView = new RedirectView("/mypage");
			redirectView.setExposeModelAttributes(false);
			mav.setView(redirectView);
		}
		//정상적으로 새로운 교양 동아리 가입 신청 완료
		else {
			clubUser.setUserId(Integer.parseInt(userInfo.getUserId()));
			clubUser.setClubId(clubId);
			clubUser.setJoinDate(LocalDateTime.now());
			
			clubUsersService.insertClub(clubUser);
			
			String alert = "<script>alert('가입 신청 완료!'); window.close();</script>";
			redirectAttributes.addFlashAttribute("alert", alert);
			
			RedirectView redirectView = new RedirectView("/mypage");
			redirectView.setExposeModelAttributes(false);
			mav.setView(redirectView);
		}
		
		return mav;
	
	}
}

