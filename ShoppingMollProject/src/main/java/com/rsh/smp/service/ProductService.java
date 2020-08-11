package com.rsh.smp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsh.smp.dao.IProductDAO;
import com.rsh.smp.vo.ColorVO;
import com.rsh.smp.vo.ProductVO;
import com.rsh.smp.vo.SizesVO;

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

	public ProductVO selectProductVO(String colums, String info) {
		return iProductDAO.selectProductVO(colums, info);
	}

	public List<ColorVO> selectColorVO(String colums, String info) {
		return iProductDAO.selectColorVO(colums, info);
	}

	public List<SizesVO> selectSizesVO(String colums, String info) {
		return iProductDAO.selectSizesVO(colums, info);
	}

	public void insertCart(String colums, String usernumber, String productnumber, String amount, String color, String sizes) {	
		iProductDAO.insertCart(colums, usernumber, productnumber, amount, color, sizes);
	}

	public String selectUserNumber(String selectColums, String colums, String info) {
		return iProductDAO.selectUserNumber(selectColums, colums, info);
	}


}
