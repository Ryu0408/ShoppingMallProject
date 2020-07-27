package com.rsh.smp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/productpage/{product}/", method = RequestMethod.GET)
	public String home(@PathVariable String product, Model model) {
		model.addAttribute("product", product);
		return "product";
	}
	
}
