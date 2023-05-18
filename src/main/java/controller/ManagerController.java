package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	ManagerService managerService;
	
	@RequestMapping("clubUsers")
	public String viewTables(Model model) {
		
		model.addAttribute("clubUsers", managerService.getAllClubUsers());
		
		return "managerClubUsers";
	}
}
