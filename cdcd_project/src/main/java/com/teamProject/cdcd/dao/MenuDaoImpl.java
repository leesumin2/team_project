package com.teamProject.cdcd.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.MenuDto;

@Repository
public class MenuDaoImpl implements MenuDao {
	
	@Autowired
	SqlSession session;
	String namespace = "com.teamProject.cdcd.menuMapper.";
	
	@Override
	public int insert(MenuDto menuDto) throws Exception {
		return session.insert(namespace+"insert", menuDto);
	}
	
	@Override
	public List<MenuDto> select(Integer cafe_id) throws Exception {
		return session.selectList(namespace+"select", cafe_id);
	}

	@Override
	public int update(MenuDto menuDto) throws Exception {
		return session.update(namespace+"update", menuDto);
	}

	@Override
	public int delete(Map map) throws Exception {
		return session.delete(namespace+"delete", map);
	}

	@Override
	public int deleteAll(Integer cafe_id) throws Exception {
		return session.delete(namespace+"deleteAll", cafe_id);
	}
	
}
