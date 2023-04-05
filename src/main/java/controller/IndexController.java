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
  public ModelAndView mainPage() {
	System.out.println("컨트롤러 호출 성공");
    List<Department> depts = deptService.getAllDepartments();
    List<Club> clubs = clubService.getAllClubs();
    System.out.println(clubs.get(0).getClubId());
    ModelAndView mav = new ModelAndView();
    mav.addObject("depts", depts);
    mav.addObject("clubs", clubs);
    mav.setViewName("home");
    return mav;
  }

	@RequestMapping("/home")
	public ModelAndView getClubList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		User userInfo = (User)request.getSession().getAttribute("SESSION");
		
		List<String> clubSW = clubService.getClubNamesByNum(1); // 동아리id가 1로 시작하는 동아리 -> 추후에 실제 학과번호에 맞춰서 수정해야함
		// List<String> clubSW = clubService.getClubNamesByNum(Integer.parseInt(clubId));
		
		mav.addObject("clubSW", clubSW);
		mav.addObject("userInfo", userInfo);
		mav.addObject("clubId", 2);
		
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping("/test")
	public ModelAndView testA(@RequestParam("id") String clubId) {
		ModelAndView mav = new ModelAndView();  
		
		//int id = Integer.parseInt(clubId);
		
		mav.addObject("abc", "hello" + clubId);
		
		mav.setViewName("test");
		return mav;
	}
}