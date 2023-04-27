package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ManageService;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	@Autowired
	ManageService manageService;
	
	@RequestMapping("viewTables")
	public String viewTables(Model model) {
		
		Map<String, Object> map = manageService.getAllTables();
		
		for ( String key : map.keySet() ) {
			model.addAttribute(key, map.get(key));
		    //System.out.println("key : " + key +" / value : " + map.get(key));
		}
		
		return "viewTables";
	}
}
