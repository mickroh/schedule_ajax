package com.care.root;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping("non_ajax")
	public String nonAjax() {
		System.out.println("non_ajax실행");
		return "non_ajax";
	}
	@RequestMapping("ajax")
	public String ajax() {
		System.out.println("ajax실행");
		return "ajax";
	}
	static int cnt = 0;
	@RequestMapping("ajax_result")
	@ResponseBody
	public String ajax_result() {
		return ++cnt + "";
	}
	@RequestMapping("ajax01")
	public String ajax01() {
		return "ajax01";
	}
	
	@RequestMapping(value="ajax_result01" ,
				produces="application/json; charset=utf8")
	@ResponseBody
	public Map ajax_result01(@RequestBody Map dto) {
		System.out.println("수신 이름 : "+dto.get("name"));
		System.out.println("수신 나이 : "+dto.get("age"));
		System.out.println("수신 주소 : "+dto.get("addr"));
		/*
		System.out.println("수신 이름 : "+dto.getName());
		System.out.println("수신 나이 : "+dto.getAge());
		dto.setName("변경이름");
		dto.setAge(12345);
		*/
		return dto;
	}
	@GetMapping("rest01")
	public String rest01() {
		return "rest01";
	}
	@GetMapping("getuser")
	public String getuser() {
		return "getuser";
	}
}










