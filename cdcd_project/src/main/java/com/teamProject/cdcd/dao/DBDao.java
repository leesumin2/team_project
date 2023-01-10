package com.teamProject.cdcd.dao;

import java.util.ArrayList;

import com.teamProject.cdcd.dto.Member;



public interface DBDao {

	Member selectUser(String id);
	
	ArrayList<Member> selectAll();

	int insertUser(Member user);

	int updateUser(Member user);

	void deleteAll() throws Exception;

	Member selectUser2(String email);
	

}