package kr.co.kosmo.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyChartJsonController {
	
	@GetMapping(value="/chart1")
	public String chartTest() {
		return "mychart";
	}
	
	// 주석주석

}
