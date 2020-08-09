package com.rsh.smp.controller;

import java.util.Random;

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
public class LoginController {
	
	@Autowired JoinService joinService;
	
	@Autowired LoginService loginService;
	
	@Inject BCryptPasswordEncoder pwdEncoder;

	@RequestMapping(value = "/login/", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/logout/", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
	
	@RequestMapping(value = "/login/users/", method = RequestMethod.POST)
	public String loginUsers(UsersVO usersVO, Model model, HttpSession session) {
		boolean alreadyExist = joinService.selectCheckJoin("id", usersVO.getId());
		if(alreadyExist == true) {
			String encodedPassword = joinService.selectUsersPassword(usersVO.getId());
			boolean comparePassword =  pwdEncoder.matches(usersVO.getPassword(), encodedPassword);
			if(comparePassword == true) {
				model.addAttribute("alertContent","로그인이 완료되었습니다^^");
				model.addAttribute("path","");
				session.setAttribute("sessionID", usersVO.getId());
			}else {
				model.addAttribute("alertContent","비밀번호가 틀렸습니다.");
				model.addAttribute("path","login/");
			}
		}else {
			model.addAttribute("alertContent","입력한 아이디가 없습니다.");
			model.addAttribute("path","login/");
		}
		return "alert";
	}
	
	@RequestMapping(value = "/login/idSearch/", method = RequestMethod.GET)
	public String loginIDSearch() {
		return "loginIDSearch";
	}
	
	@RequestMapping(value = "/login/idSearch/", method = RequestMethod.POST)
	public String loginIDSearchCheck(UsersVO usersVO, Model model) {
		if(usersVO.getEmail() != null) {
			boolean alreadyExist = loginService.selectEmailIDSearch("name","email", 
					usersVO.getName(), usersVO.getEmail());
			if(alreadyExist == true) {
				usersVO = loginService.selectGetUsers("email",usersVO.getEmail());
				model.addAttribute("alertContent","찾으시는 아이디는 " + usersVO.getId() + "입니다.");
				model.addAttribute("path","login/");
			}else {
				model.addAttribute("alertContent","입력한 이메일 또는 이름이 맞지 않습니다");
				model.addAttribute("path","login/idSearch/");
			}
		}else if(usersVO.getPhone2() != null) {
			boolean alreadyExist = loginService.selectPhoneIDSearch("name","phone1", "phone2"
					, "phone3", usersVO.getName(), usersVO.getPhone1(), usersVO.getPhone2(),
					usersVO.getPhone3());
			if(alreadyExist == true) {
				usersVO = loginService.selectGetUsersPhone("phone1","phone2","phone3", 
						usersVO.getPhone1(), usersVO.getPhone2(), usersVO.getPhone3());
				model.addAttribute("alertContent","찾으시는 아이디는 " + usersVO.getId() + "입니다.");
				model.addAttribute("path","login/");
			}else {
				model.addAttribute("alertContent","입력한 전화번호 또는 이름이 맞지 않습니다");
				model.addAttribute("path","login/idSearch/");
			}
		}
		return "alert";
	}
	
	@RequestMapping(value = "/login/passwordSearch/", method = RequestMethod.GET)
	public String loginPasswordSearch() {
		return "loginPasswordSearch";
	}
	
	@RequestMapping(value = "/login/passwordSearch/", method = RequestMethod.POST)
	public String loginPasswordSearchCheck(UsersVO usersVO, Model model) {
		if(usersVO.getEmail() != null) {
			boolean alreadyExist = loginService.selectEmailPasswordSearch("id", "name","email", 
					usersVO.getId(), usersVO.getName(), usersVO.getEmail());
			if(alreadyExist == true) {
				usersVO = loginService.selectGetUsers("email",usersVO.getEmail());
				StringBuffer tempPassword = tempPassword();
				usersVO.setPassword(tempPassword.toString());
				loginService.updateUsers("password", usersVO.getPassword());
				model.addAttribute("usersVO", usersVO);
				return "mailService";
			}else {
				model.addAttribute("alertContent","입력한 아이디/이메일 또는 이름이 맞지 않습니다");
				model.addAttribute("path","login/passwordSearch/");
			}
		}else if(usersVO.getPhone2() != null) {
			boolean alreadyExist = loginService.selectPhoneIDSearch("name","phone1", "phone2"
					, "phone3", usersVO.getName(), usersVO.getPhone1(), usersVO.getPhone2(),
					usersVO.getPhone3());
			if(alreadyExist == true) {
				usersVO = loginService.selectGetUsersPhone("phone1","phone2","phone3", 
						usersVO.getPhone1(), usersVO.getPhone2(), usersVO.getPhone3());
				model.addAttribute("alertContent","찾으시는 아이디는 " + usersVO.getId() + "입니다.");
				model.addAttribute("path","login/");
			}else {
				model.addAttribute("alertContent","입력한 아이디/전화번호 또는 이름이 맞지 않습니다");
				model.addAttribute("path","login/passwordSearch/");
			}
		}
		return "alert";

	}
	public StringBuffer tempPassword() {
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		for(int i=0;i<10;i++){
			if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10)));
		    }
		}
		return buf;
	}
}
