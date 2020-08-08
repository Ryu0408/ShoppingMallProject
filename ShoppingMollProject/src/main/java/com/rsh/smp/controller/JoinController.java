package com.rsh.smp.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rsh.smp.service.JoinService;
import com.rsh.smp.vo.UsersVO;

@Controller
public class JoinController {

	@Autowired ResourceLoader resourceLoader;
	
	@Inject BCryptPasswordEncoder pwdEncoder;
	
	@Autowired JoinService joinService;

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
	
	@RequestMapping(value = "/join/insert", method = RequestMethod.POST)
	public String joinInsert(UsersVO usersVO, Model model) {
		String inputPass = usersVO.getPassword();
		String pwd = pwdEncoder.encode(inputPass);
		usersVO.setPassword(pwd);
		if(usersVO.getAgreeEmailCheck() == null) {usersVO.setAgreeEmailCheck("off");}
		if(usersVO.getAgreeSmsCheck() == null) {usersVO.setAgreeSmsCheck("off");}
		joinService.insertUsers(usersVO);
		return "joinSuccess";
	}
	
	@RequestMapping(value = "/join/checkid/", produces="application/text;charset=utf8")
	@ResponseBody
	public String checkID(String id) {
		boolean alreadyExist = joinService.selectCheckJoin("id",id);
		return alreadyExist ? "이미 사용중인 계정입니다" : "사용 가능한 계정입니다";
	}
	
	@RequestMapping(value = "/join/checkemail/", produces="application/text;charset=utf8")
	@ResponseBody
	public String checkemail(String email) {
		boolean alreadyExist = joinService.selectCheckJoin("email",email);
		return alreadyExist ? "이미 사용중인 EMAIL입니다" : "사용 가능한 EMAIL입니다";
	}
}
