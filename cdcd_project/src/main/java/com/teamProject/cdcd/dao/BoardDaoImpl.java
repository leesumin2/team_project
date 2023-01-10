package com.teamProject.cdcd.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.BoardDto;
import com.teamProject.cdcd.dto.CommentDto;
import com.teamProject.cdcd.dto.SearchCondition;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	SqlSession session; // session ����, sql����� �����ϴµ� �ʿ��� �޼��� ���� 
	String namespace ="com.greenart.bd.";
	 

	@Override
	public int deleteAll() {
		return session.delete(namespace+"deleteAll");
	} // int delete(String statement)
	

	@Override
	public int delete(Integer ask_id, String mem_id) throws Exception {
		Map map = new HashMap();
		map.put("ask_id", ask_id);
		map.put("mem_id", mem_id);
		
		return session.delete(namespace+"delete", map);
	} // int delete(String statement, Object parameter)
	

	@Override
	public int insert(BoardDto dto) throws Exception {
		return session.insert(namespace+"insert", dto);
	}// int insert(String statement, Object parameter)

	@Override
	public List<BoardDto> selectAll() throws Exception{
		return session.selectList(namespace+"selectAll");
	}// List<E> selectList(String statement)
	
	@Override
	public BoardDto select (Integer ask_id) throws Exception{
		return session.selectOne(namespace+"select", ask_id);
	} // T SelectOne(String statement, Object parameter)
		
	@Override
	public int increaseViewCnt(Integer ask_id) throws Exception{
		return session.update(namespace+"increaseViewCnt", ask_id);
	} // int update (String statement, Object parameter)
	
    @Override
	public int count() throws Exception {
        return session.selectOne(namespace+"count");
    } // T selectOne(String statement)
	

    @Override
	public int update(BoardDto dto) throws Exception {
        return session.update(namespace+"update", dto);
    } // int update(String statement, Object parameter)
    
    // �Խ��� ������

    @Override
	public List<BoardDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage", map);
    } // List<E> selectList(String statement, Object parameter)
    
    @Override
	public List<BoardDto> searchSelectPage0(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"searchSelectPage0", sc);
    } // List<E> selectList(String statement, Object parameter)
    @Override
	public List<BoardDto> searchSelectPage1(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"searchSelectPage1", sc);
    } // List<E> selectList(String statement, Object parameter)
    @Override
	public List<BoardDto> searchSelectPage2(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"searchSelectPage2", sc);
    } // List<E> selectList(String statement, Object parameter)
    
    @Override
	public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace+"searchResultCnt",sc);
    } // T selectOne(String statement)
    
    // ��� ���� �κ� 
    public int updateCommentCnt(Integer ask_id, Integer ask_comentcnt) throws Exception {
    	Map map = new HashMap();
    	map.put("ask_comentcnt", ask_comentcnt);
    	map.put("ask_id", ask_id); 
    	return session.update(namespace+"updateCommentCnt", map);
    }
    @Override
	public List<BoardDto> memselectAll(String mem_id) throws Exception{
		return session.selectList(namespace+"memselectAll", mem_id);
	}
    
    @Override
	public List<BoardDto> viewselectAll(String mem_id) throws Exception{
		return session.selectList(namespace+"viewselectAll", mem_id);
	}
    @Override
	public List<BoardDto> commentselectAll(String mem_id) throws Exception{
		return session.selectList(namespace+"commentselectAll", mem_id);
	}
    
}
//searchResultCnt, searchSelectpage �ۼ� x