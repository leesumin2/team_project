package com.teamProject.cdcd.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.CommentDto;

@Repository
public class CommentDaoImpl implements CommentDao {
	@Autowired
	SqlSession session; // session ����, sql����� �����ϴµ� �ʿ��� �޼��� ���� 
	String namespace ="com.greenart.CommentMapper.";
	
	@Override
	public int deleteAll(Integer ask_id) throws Exception{
		return session.delete(namespace+"deleteAll", ask_id);
	}
	
	@Override
	public int count(Integer ask_id )throws Exception{
		return session.selectOne(namespace+"count", ask_id);
	}
	
	@Override
	public int delete(Integer a_coment_id, String mem_id) throws Exception {
		Map map = new HashMap();
		map.put("a_coment_id", a_coment_id);
		map.put("mem_id", mem_id);
		return session.delete(namespace+"delete",map);
	}
	
	@Override
	public int insert(CommentDto commentDto) {
		return session.insert(namespace+"insert", commentDto);
	}
	
	@Override
	public List<CommentDto> selectAll(Integer ask_id) throws Exception{
		return session.selectList(namespace+"selectAll", ask_id);
	}
	@Override
	public CommentDto select (Integer ask_id) {
		return session.selectOne(namespace+"select", ask_id);
	}
	@Override
	public List<CommentDto> memselectAll(String mem_id) throws Exception{
		return session.selectList(namespace+"memselectAll", mem_id);
	}
	@Override
	public int update(CommentDto commentDto) {
		return session.update(namespace+"update", commentDto);
	}
}
