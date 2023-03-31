package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
