package com.rsh.smp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsh.smp.dao.IProductDAO;
import com.rsh.smp.vo.ProductVO;

@Service
public class ProductService {

	@Autowired IProductDAO iProductDAO;
	
	private final int perPage = 16;
	
	public int selectProductSize(String product){
		int productSize = iProductDAO.selectProduct(product);
		return productSize;
	}

	public Object selectProductPage(String product, String sort, String page) {
		int first = (Integer.parseInt(page) - 1) * perPage + 1;
		int last = first + perPage - 1;
		List<ProductVO> listProductVO = iProductDAO.selectProductPage(product, sort, first, last);
		return listProductVO;
	}

}
