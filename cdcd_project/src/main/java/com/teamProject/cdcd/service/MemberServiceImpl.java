package com.teamProject.cdcd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamProject.cdcd.dao.MemberDao;
import com.teamProject.cdcd.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public int signUp(MemberDto memberdto) throws Exception {
		return memberDao.insert(memberdto);
	}
	
	@Override
	public MemberDto idCheck(String mem_id) throws Exception {
		System.out.println("MemberServiceImpl idCheck() is called");
				
		return memberDao.selectId(mem_id);
	}
	
	@Override
	public MemberDto emailCheck(String mem_email) throws Exception {
		System.out.println("MemberServiceImpl emailCheck() is called");
				
		return memberDao.selectEmail(mem_email);
	}
	
	/*    異붽�      */
	@Override
	public List<MemberDto> getList() throws Exception{
		return memberDao.selectAll();
	}
	
	@Override
	public int remove(String mem_id) throws Exception{
		return memberDao.delete(mem_id);
	}
}
