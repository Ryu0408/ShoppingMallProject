package com.rsh.smp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rsh.smp.vo.ProductVO;

public interface IProductDAO {

	List<ProductVO> selectProduct(@Param("product") String product);
}
