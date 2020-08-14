package com.rsh.smp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsh.smp.dao.ICartDAO;
import com.rsh.smp.vo.CartVO;

@Service
public class CartService {

	@Autowired ICartDAO iCartDAO;
	
	public List<CartVO> selectCartVO(String colums, String info) {
		return iCartDAO.selectCartVO(colums, info);
	}
	public void deleteCart(String colums, String number, String color, String sizes) {
		iCartDAO.deleteCart(colums, number, color, sizes);
	}

}
