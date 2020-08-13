package com.rsh.smp.dao;

import org.apache.ibatis.annotations.Param;

public interface IMainDAO {

	void insert2(@Param("i")int i, @Param("string")String string);

}
