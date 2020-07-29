package com.rsh.smp.controller;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	@Autowired ResourceLoader resourceLoader;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
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
	
	@RequestMapping(value = "/popup/", method = RequestMethod.GET)
	public String popup() {
		return "jusoPopup";
	}
	
}
