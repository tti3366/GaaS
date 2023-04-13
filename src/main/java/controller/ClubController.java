package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Club;
import service.ClubService;

@Controller
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	
	@RequestMapping("/createclub")
	public String createClub() {
		return "createclub";
	}
	
	@PostMapping("/enrollclub")
	public String enrollclub(@ModelAttribute("createClub") Club club) {
		int result=clubService.insertClub(club);
		System.out.println(result);
		
		return "";
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
