package com.teamProject.cdcd.service;

import java.util.List;

import com.teamProject.cdcd.dto.MemberDto;

public interface MemberService {

	int signUp(MemberDto memberdto) throws Exception;

	MemberDto idCheck(String mem_id) throws Exception;

	MemberDto emailCheck(String mem_email) throws Exception;

	/*    異붽�     */
	List<MemberDto> getList() throws Exception;
	

	int remove(String mem_id) throws Exception;

}