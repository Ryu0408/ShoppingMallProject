package com.rsh.smp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

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
	public String join() {
		return "join";
	}
	
}
