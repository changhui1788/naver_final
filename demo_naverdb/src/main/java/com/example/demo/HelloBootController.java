package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloBootController {
	@GetMapping("/helloboot")
	String helloboot() {
		return "helloboot";
	}
	
	@GetMapping("/helloajax")
	@ResponseBody
	public String helloajax() {
		return "{\"model\" : \"스프링 ajax 시작\"}";
	}
}
