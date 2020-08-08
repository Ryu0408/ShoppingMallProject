package com.rsh.smp.controller;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rsh.smp.service.MainService;

@Controller
public class MainController {

	@Autowired MainService mainservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
		
	@RequestMapping(value = "/login/", method = RequestMethod.GET)
	public String login() {
		return "login";
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
