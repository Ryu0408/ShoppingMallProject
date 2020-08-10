package com.rsh.smp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsh.smp.dao.IJoinDAO;
import com.rsh.smp.vo.UsersVO;

@Service
public class JoinService {

	@Autowired IJoinDAO iJoinDAO;
	
	public boolean selectCheckJoin(String columnName, String info) {
		String checkInfo = iJoinDAO.selectCheckJoin(columnName, info);
		boolean alreadyExist;
		if(checkInfo == null) { alreadyExist = false;} else {alreadyExist = true;}
		return alreadyExist;
	}
	
	public void insertUsers(UsersVO usersVO) {
		iJoinDAO.insertUsers(usersVO);
	}
	
	public String selectUsersPassword(String id) {
		String password = iJoinDAO.selectUsersPassword(id);
		return password;
	}

	public void updateUsers(UsersVO usersVO) {
		iJoinDAO.updateUsers(usersVO);
	}
}
