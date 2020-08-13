package com.rsh.smp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsh.smp.dao.IMainDAO;


@Service
public class MainService {

	@Autowired IMainDAO iMainDAO;
	public void insert2(int i, String string) {
		iMainDAO.insert2(i,string);
	}

	
}
