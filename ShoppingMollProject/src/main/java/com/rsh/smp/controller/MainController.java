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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rsh.smp.service.MainService;

@Controller
public class MainController {

	@Autowired ResourceLoader resourceLoader;
	@Autowired MainService mainservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		System.out.println(mainservice.dbtest());
		return "main";
	}
	
	@RequestMapping(value = "/productpage/{product}/", method = RequestMethod.GET)
	public String product(@PathVariable String product, Model model) {
		model.addAttribute("product", product);
		return "product";
	}
	
	@RequestMapping(value = "/login/", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/join/", method = RequestMethod.GET)
	public String join(Model model) {
		Resource resource[] = {
				resourceLoader.getResource("classpath:agreeFiles/agreeService.txt"),
				resourceLoader.getResource("classpath:agreeFiles/agreePrivacy.txt"),
				resourceLoader.getResource("classpath:agreeFiles/agreeSms.txt"),
		};
		try {
			for(int i = 0 ; i < resource.length ; i ++) {
			    Path path = Paths.get(resource[i].getURI());
			    List<String> content = Files.readAllLines(path);
			    String str = resource[i].getFilename();
			    String result = str.substring(0, str.lastIndexOf("."));
			    model.addAttribute(result, content);
			}

		} catch (IOException e) {
			System.out.println(e);
		}
		return "join";
	}
	
	@RequestMapping(value = "/join/checkid/", produces="application/text;charset=utf8")
	@ResponseBody
	public String checkid(String id) {
		boolean alreadyExist = false;
		return alreadyExist ? "이미 사용중인 계정입니다" : "사용 가능한 계정입니다";
	}
	
	@RequestMapping(value = "/join/checkemail/", produces="application/text;charset=utf8")
	@ResponseBody
	public String checkemail(String email) {
		boolean alreadyExist = false;
		return alreadyExist ? "이미 사용중인 EMAIL입니다" : "사용 가능한 EMAIL입니다";
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
