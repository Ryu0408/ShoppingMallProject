package com.rsh.smp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rsh.smp.dao.IJoinDAO;
import com.rsh.smp.dao.IProductDAO;
import com.rsh.smp.vo.UsersVO;

@Service
public class JoinService {

	@Autowired IJoinDAO iJoinDAO;
	
	@Autowired IProductDAO iProductDAO;
	
	public boolean selectCheckJoin(String columnName, String info) {
		String checkInfo = iJoinDAO.selectCheckJoin(columnName, info);
		boolean alreadyExist;
		if(checkInfo == null) { alreadyExist = false;} else {alreadyExist = true;}
		return alreadyExist;
	}
	
	@Transactional
	public void insertUsers(UsersVO usersVO) {
		iJoinDAO.insertUsers(usersVO);
		String usernumber = iProductDAO.selectUserNumber("usernumber","id", usersVO.getId());
		iJoinDAO.insertNewCoupon(usernumber,"신규가입 회원 쿠폰입니다^^(2000원 할인쿠폰)", -2000);
	}
	
	public String selectUsersPassword(String id) {
		String password = iJoinDAO.selectUsersPassword(id);
		return password;
	}

	public void updateUsers(UsersVO usersVO) {
		iJoinDAO.updateUsers(usersVO);
	}
}
