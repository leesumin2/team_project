package com.teamProject.cdcd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSession session;
	// 1124º¯°æ
	String namespace = "com.teamProject.cdcd.memberMapper.";
	
	@Override
	public int insert(MemberDto memberDto) throws Exception {
		return session.insert(namespace+"insert", memberDto);
	}
	
	@Override
	public MemberDto selectId(String mem_id) throws Exception {
		System.out.println("MemberDaoImpl selectId() is called");
		return session.selectOne(namespace+"selectId", mem_id);
	}
	
	@Override
	public MemberDto selectEmail(String mem_email) throws Exception {
		System.out.println("MemberDaoImpl selectEmail() is called");
		return session.selectOne(namespace+"selectEmail", mem_email);
	}

	@Override
	public List<MemberDto> selectAll() throws Exception{
		return session.selectList(namespace+ "selectAll");
	}

	@Override
	public int delete(String mem_id) {
		System.out.println("MemberDaoImpl delete() is called");
		return session.delete(namespace+"delete", mem_id);
	}
}
