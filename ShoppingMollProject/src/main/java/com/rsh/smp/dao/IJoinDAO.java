package com.rsh.smp.dao;

import org.apache.ibatis.annotations.Param;

import com.rsh.smp.vo.UsersVO;

public interface IJoinDAO {

	String selectCheckJoin(@Param("columnName") String columnName, @Param("info") String info);

	void insertUsers(UsersVO usersVO);

}
