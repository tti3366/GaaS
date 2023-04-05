package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostController {
	// 테스트용
	@RequestMapping("/")
	public String indexPage() {
		System.out.println("index 접근");
		return "index";
	}
}
