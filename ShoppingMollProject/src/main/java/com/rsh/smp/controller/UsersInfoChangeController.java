package com.rsh.smp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.LoginService;
import com.rsh.smp.vo.UsersVO;

@Controller
public class UsersInfoChangeController {
	
	@Autowired LoginService loginService;

	@RequestMapping(value = "/userinfochange/", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		String usersSession = (String) session.getAttribute("sessionID");
		if(usersSession == null) {
			model.addAttribute("alertContent","로그인 해주세요^^");
			model.addAttribute("path","login/");
			return "alert";
		}
		UsersVO usersVO = loginService.selectGetUsers("id",usersSession);
		model.addAttribute(usersVO);
		return "userInfoChange";
	}
}
