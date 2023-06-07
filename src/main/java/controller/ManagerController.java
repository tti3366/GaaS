package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import model.Club;
import model.ClubUsers;
import model.User;
import service.ClubService;
import service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	ClubService clubService;
	
	@Autowired
	ManagerService managerService;
	
	@RequestMapping("clubUsers")
	public String viewTables(Model model, HttpServletRequest request) {
		try {
			// 로그인한 사용자 정보
			User user = (User) request.getSession().getAttribute("SESSION");
			
			if(user.getAuthority().equals("manager")) { // 동아리장 판단
				String managerId = user.getUserId();
				
				Club c = clubService.getClubByManagerId(managerId);
				List<ClubUsers> cu_list = managerService.getClubUsersByManagerId(managerId);
				
				// 날짜 형식 변환
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				for(ClubUsers cu : cu_list) {
					cu.setJoinDateStr(
						cu.getJoinDate().format(formatter)
					);
				}
				
				model.addAttribute("club", c);
				model.addAttribute("clubUsers", cu_list);
				
				return "managerClubUsers";
			}
			else { // 권한이 없습니다
				return "/home";
			}
		} catch (Exception e) {
			System.out.println("[Exception] ManagerController - clubUsers");
			return "/home";
		}
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
	        objectMapper.registerModule(new JavaTimeModule());
	        
	        // System.out.println("target : " + target);
	        if (target.equals("clubUsers")) {
	        	ClubUsers command = objectMapper.readValue(inputStreamReader, ClubUsers.class);
	        	managerService.modifyClubUsers(command);
	        	
	        	success = true;
		    } 
	        result.put("success", success);	// Ajax에서 요청 처리 후 성공 여부 체크

	        return result;
	    } catch (IOException e) {
	    	System.out.println("[Exception] ManagerController - modifyTarget" + e);
	    	
	    	Map<String, Object> result = new HashMap<>();
	    	result.put("success", false);
	    	return result;
	    } 

	}
}
