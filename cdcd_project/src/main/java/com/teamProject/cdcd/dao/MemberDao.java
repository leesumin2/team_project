package com.teamProject.cdcd.dao;

import java.util.List;

import com.teamProject.cdcd.dto.MemberDto;

public interface MemberDao {

	int insert(MemberDto memberDto) throws Exception;

	MemberDto selectId(String mem_id) throws Exception;

	MemberDto selectEmail(String mem_email) throws Exception;

	List<MemberDto> selectAll() throws Exception;

	int delete(String mem_id);

}