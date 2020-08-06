package com.rsh.smp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsh.smp.dao.IProductDAO;
import com.rsh.smp.vo.ProductVO;

@Service
public class ProductService {

	@Autowired IProductDAO iProductDAO;
	
	public List<ProductVO> selectProduct(String product){
		List<ProductVO> listProductVO = iProductDAO.selectProduct(product);
		return listProductVO;
	}

}
