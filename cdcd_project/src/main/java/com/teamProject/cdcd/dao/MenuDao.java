package com.teamProject.cdcd.dao;

import java.util.List;
import java.util.Map;

import com.teamProject.cdcd.dto.MenuDto;

public interface MenuDao {

	int insert(MenuDto menuDto) throws Exception;

	List<MenuDto> select(Integer cafe_id) throws Exception;
	
	int update(MenuDto menuDto) throws Exception;

	int delete(Map map) throws Exception;
	
	int deleteAll(Integer cafe_id) throws Exception;

}