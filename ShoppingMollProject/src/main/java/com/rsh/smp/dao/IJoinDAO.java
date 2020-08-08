package com.rsh.smp.dao;

import org.apache.ibatis.annotations.Param;

public interface IJoinDAO {

	String selectCheckJoin(@Param("columnName") String columnName, @Param("info") String info);

}
