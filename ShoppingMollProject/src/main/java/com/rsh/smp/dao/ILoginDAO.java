package com.rsh.smp.dao;

import org.apache.ibatis.annotations.Param;

import com.rsh.smp.vo.UsersVO;

public interface ILoginDAO {

	String selectEmailIDSearch(@Param("colums1")String colums1, 
			@Param("colums2") String colums2, @Param("name")String name, @Param("email")String email);

	UsersVO selectGetUsers(@Param("colums")String colums, @Param("info") String info);

	String selectPhoneIDSearch(@Param("colums1")String colums1, @Param("colums2")String colums2, 
			@Param("colums3")String colums3, @Param("colums4")String colums4, @Param("name") String name,
			@Param("phone1")String phone1, @Param("phone2")String phone2, @Param("phone3")String phone3);

	UsersVO selectGetUsersPhone(@Param("colums1")String colums1, @Param("colums2")String colums2, 
			@Param("colums3")String colums3, @Param("info1")String info1, @Param("info2")String info2,
			@Param("info3")String info3);

	String selectEmailPasswordSearch(@Param("colums1")String colums1, @Param("colums2")String colums2, 
			@Param("colums3")String colums3, @Param("id")String id, @Param("name")String name,
			@Param("email") String email);

	void updateUsers(@Param("colums1") String colums1, @Param("colums2")String colums2, 
			@Param("email")String email, @Param("password") String password);

	String selectPhonePasswordSearch(@Param("colums1")String colums1, @Param("colums2")String colums2, 
			@Param("colums3")String colums3, @Param("colums4") String colums4, @Param("colums5")String colums5,
			@Param("id")String id, @Param("name")String name, @Param("phone1")String phone1, 
			@Param("phone2")String phone2, @Param("phone3")String phone3);

}
