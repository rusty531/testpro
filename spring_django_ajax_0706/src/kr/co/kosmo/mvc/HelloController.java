package kr.co.kosmo.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {
	
	@GetMapping(value="/hello")
	public String hello(Model m) {
		m.addAttribute("msg", "안녕하세요 ^^ 스프링 복습입니다.");
		return "hello";
	}

}
