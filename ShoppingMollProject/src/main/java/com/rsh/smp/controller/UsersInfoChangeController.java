package com.rsh.smp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.JoinService;
import com.rsh.smp.service.LoginService;
import com.rsh.smp.vo.UsersVO;

@Controller
public class UsersInfoChangeController {
	
	@Autowired LoginService loginService;
	
	@Inject BCryptPasswordEncoder pwdEncoder;
	
	@Autowired JoinService joinService;


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
	
	@RequestMapping(value = "/join/updateusers", method = RequestMethod.POST)
	public String joinInsert(UsersVO usersVO, Model model) {
		String inputPass = usersVO.getPassword();
		String pwd = pwdEncoder.encode(inputPass);
		usersVO.setPassword(pwd);
		if(usersVO.getAgreeEmailCheck() == null) {usersVO.setAgreeEmailCheck("off");}
		if(usersVO.getAgreeSmsCheck() == null) {usersVO.setAgreeSmsCheck("off");}
		joinService.updateUsers(usersVO);
		model.addAttribute("alertContent","회원정보가 수정되었습니다^^");
		model.addAttribute("path","mypage/");
		return "alert";
	}
}
