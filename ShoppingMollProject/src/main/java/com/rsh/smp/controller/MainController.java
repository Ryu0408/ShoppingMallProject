package com.rsh.smp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.MainService;

@Controller
public class MainController {

	@Autowired MainService mainservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
				
	@RequestMapping(value = "/cart/", method = RequestMethod.GET)
	public String cart() {
		return "cart";
	}
	
	@RequestMapping(value = "/mypage/", method = RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
	
	@RequestMapping(value = "/notice/", method = RequestMethod.GET)
	public String notice() {
		return "notice";
	}
	
	@RequestMapping(value = "/q&a/", method = RequestMethod.GET)
	public String qna() {
		return "q&a";
	}
	
	@RequestMapping(value = "/review/", method = RequestMethod.GET)
	public String review() {
		return "review";
	}

}
