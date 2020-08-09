package com.rsh.smp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsh.smp.dao.ILoginDAO;
import com.rsh.smp.vo.UsersVO;

@Service
public class LoginService {

	@Autowired ILoginDAO iLoginDAO;
	public boolean selectEmailIDSearch(String colums1, String colums2, String name, String email) {
		String emailIDSearch = iLoginDAO.selectEmailIDSearch(colums1, colums2, name, email);
		boolean alreadyExist;
		if(emailIDSearch != null) { alreadyExist = true;}
		else {alreadyExist = false;}
		return alreadyExist;
	}

	public boolean selectPhoneIDSearch(String colums1, String colums2, String colums3, String colums4, String name,
			String phone1, String phone2, String phone3) {
		String phoneIDSearch = iLoginDAO.selectPhoneIDSearch(colums1, colums2, colums3, colums4, name,
				phone1, phone2, phone3);
		boolean alreadyExist;
		if(phoneIDSearch != null) { alreadyExist = true;}
		else {alreadyExist = false;}
		return alreadyExist;
	}
	
	public UsersVO selectGetUsers(String colums, String info) {
		return iLoginDAO.selectGetUsers(colums, info);
	}

	public UsersVO selectGetUsersPhone(String colums1, String colums2, String colums3, String info1, String info2,
			String info3) {
		return iLoginDAO.selectGetUsersPhone(colums1, colums2, colums3, info1, info2, info3);
	}

	public boolean selectEmailPasswordSearch(String colums1, String colums2, String colums3, String id, String name,
			String email) {
		String emailPasswordSearch = iLoginDAO.selectEmailPasswordSearch(colums1, colums2, colums3, id, name, email);
		boolean alreadyExist;
		if(emailPasswordSearch != null) { alreadyExist = true;}
		else {alreadyExist = false;}
		return alreadyExist;
	}

}
