package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Club;
import model.Department;
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

}

