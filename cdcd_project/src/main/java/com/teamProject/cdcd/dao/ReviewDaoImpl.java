package com.teamProject.cdcd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	SqlSession session;
	@Autowired
	DataSource ds;
	String namespace = "com.teamProject.cdcd.";

	@Override
	public int deleteAll() {
		return session.delete(namespace + "deleteAll");
	}

	@Override
	public int delete(Integer review_id, String mem_id) throws Exception {
		Map map = new HashMap();
		map.put("review_id", review_id);
		map.put("mem_id", mem_id);

		return session.delete(namespace + "delete", map);
	}

	@Override
	public int insert(ReviewDto dto) throws Exception {
		System.out.println("ReviewDao ReviewCafe is called");
		return session.insert(namespace + "insert", dto);
	}

	@Override
	public List<ReviewDto> selectAll() throws Exception {
		return session.selectList(namespace + "selectAll");
	}

	@Override
	public ReviewDto select(Integer review_id) throws Exception {
		return session.selectOne(namespace + "select", review_id);
	}

	/*
	 * @Override public int increaseViewCnt(Integer review_id) throws Exception {
	 * return session.update(namespace + "increaseViewCnt", review_id); }
	 */

	@Override
	public int update(ReviewDto dto) throws Exception {
		return session.update(namespace + "update", dto);
	}

	@Override
	public int count() throws Exception{
		return session.selectOne(namespace+"count");
	}

	@Override
	public List<ReviewDto> total_avg() throws Exception{
		return session.selectList(namespace+"total_avg");
	}

	
	@Override
	public String[][] ReviewtopSelect() {
		String sql="SELECT cafe_id, sum(dessert_score)/count(dessert_score) AS avg FROM review GROUP BY cafe_id ORDER BY avg DESC LIMIT 6";
		String[][] topriv = new String[6][2];
		int cnt=0;
		try (
			Connection conn=ds.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
		){
			while(rs.next()) {
				String a=rs.getString(1);
				String b=rs.getString(2);
				topriv[cnt][0]=a;
				topriv[cnt][1]=b;
				cnt++;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return topriv;
	}
	
	@Override
	   public List<ReviewDto> selectCafeReview(Integer cafe_id) throws Exception {
	      return session.selectList(namespace+"selectCafeReview", cafe_id);
	   }
//	�߰� 11.29
	@Override
	public List<ReviewDto> selectAllOld(Integer cafe_id) throws Exception {
		return session.selectList(namespace + "selectAllOld", cafe_id);
	}
	@Override
	public List<ReviewDto> selectLike(Integer cafe_id) throws Exception {
		return session.selectList(namespace + "selectLike", cafe_id);
	}
// 	��
	@Override
		public List<ReviewDto> reviewList(String mem_id) throws Exception{
		return session.selectList(namespace+"reviewList", mem_id);
	}

	private void close(AutoCloseable...acs) {
		for(AutoCloseable ac:acs) {
			try {
				if(ac!=null)ac.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
