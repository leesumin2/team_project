package com.teamProject.cdcd.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.ReviewLikeDto;
@Repository
public class ReviewLikeDaoImpl implements ReviewLikeDao  {
	@Autowired
	SqlSession session;
	String namespace = "com.green.cdcd.reviewlikeMapper.";
	
	



	@Override
	public int insert(ReviewLikeDto reviewlikeDto) {
		return session.insert(namespace+"insert", reviewlikeDto);
	}
	


	@Override
	public List<ReviewLikeDto> selectAll() throws Exception {
		return session.selectList(namespace + "selectAll");
	}
	


	@Override
	public int likecount(Integer review_id) throws Exception {
		return session.selectOne(namespace+"likecount", review_id);
	}
	@Override
	public int likefindid(Integer review_id, String mem_id) throws Exception {
		Map map = new HashMap();
		map.put("review_id", review_id);
		map.put("mem_id", mem_id);
		return session.selectOne(namespace+"likefindid", map);
	}
	@Override
	public int delete(Integer review_id, String mem_id) throws Exception {
		Map map = new HashMap();
		map.put("review_id", review_id);
		map.put("mem_id", mem_id);

		return session.delete(namespace + "delete", map);
	}

}
