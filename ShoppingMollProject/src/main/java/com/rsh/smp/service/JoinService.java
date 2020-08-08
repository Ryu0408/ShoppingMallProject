package com.rsh.smp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsh.smp.dao.IJoinDAO;

@Service
public class JoinService {

	@Autowired IJoinDAO iJoinDAO;
	
	public boolean selectCheckJoin(String columnName, String info) {
		String checkInfo = iJoinDAO.selectCheckJoin(columnName, info);
		boolean alreadyExist;
		if(checkInfo == null) { alreadyExist = false;} else {alreadyExist = true;}
		return alreadyExist;
	}
}
