package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.Club;
import model.Dept;
import model.User;
import service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("viewTables")
	public String viewTables(Model model) {
		
		Map<String, Object> map = adminService.getAllTables();
		
		for ( String key : map.keySet() ) {
			model.addAttribute(key, map.get(key));
		    // System.out.println("key : " + key +" / value : " + map.get(key));
		}
		
		return "viewTables";
	}
	
	@RequestMapping("/modify/{target}")
	@ResponseBody
	public Map<String, Object> modifyTarget(@PathVariable String target, HttpServletRequest request) {
		
		try {
			Map<String, Object> result = new HashMap<>();
			
			boolean success = false; // 요청 처리 성공 여부
			
	        // 요청 본문 읽어들이기
	        InputStream inputStream = request.getInputStream();
	        InputStreamReader inputStreamReader = new InputStreamReader(inputStream);

	        // JSON 데이터 파싱하기
	        ObjectMapper objectMapper = new ObjectMapper();
	        
	        // System.out.println("target : " + target);
	        
	        if (target.equals("user")) {
	        	User command = objectMapper.readValue(inputStreamReader, User.class);
	        	adminService.modifyUser(command);
	        	success = true;
		    } else if (target.equals("dept")) {
	        	Dept command = objectMapper.readValue(inputStreamReader, Dept.class);
	        	adminService.modifyDept(command);
	        	success = true;
		    } else if (target.equals("club")) {
		    	Club command = objectMapper.readValue(inputStreamReader, Club.class);
		    	adminService.modifyClub(command);
		    	success = true;
		    }
	        
	        result.put("success", success);	// Ajax에서 요청 처리 후 성공 여부 체크

	        return result;
	    } catch (IOException e) {
	    	Map<String, Object> result = new HashMap<>();
	    	result.put("success", false);
	    	return result;
	    } 

	}

	@RequestMapping("/delete/{target}")
	@ResponseBody
	public String deleteTarget(@PathVariable String target, String targetId) {		
        if (target.equals("user")) {
        		
	    } else if (target.equals("dept")) {
	    	
	    } else if (target.equals("club")) {
	    	if(adminService.deleteClub(targetId))
	    		return "success";
	    }
        return "failure";
	}
}
