package com.teamProject.cdcd.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.CafeDto;
import com.teamProject.cdcd.dto.SearchOption;


@Repository
public class CafeDaoImpl implements CafeDao {

	
//	@Autowired
//	DataSource ds;
//	final int FALE = 0;
//
//	@Override
//	public ArrayList<Cafe> selectAll() {
//		Cafe cafe = null;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "select * from cafe";
//		ArrayList<Cafe> cafes;
//		try {
//			conn = ds.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			cafes = new ArrayList<Cafe>();
//			while (rs.next()) {
//				cafe = new Cafe();
//				cafe.setCafe_id(rs.getInt(1));
//				cafe.setCafe_name(rs.getString(2));
//				cafe.setCafe_img(rs.getString(3));
//				cafe.setCafe_info(rs.getString(4));
//				cafe.setCafe_num(rs.getInt(5));
//				cafe.setCafe_addr1(rs.getString(6));
//				cafe.setCafe_addr2(rs.getString(7));
//				cafe.setCafe_addr2(rs.getString(8));
//				cafe.setCafe_open(rs.getTime(9));
//				cafes.add(cafe);
//			}
//		} catch (SQLException e) {
//			return null;
//		}finally {
//			close(rs, pstmt, conn);
//		}
//		return cafes;
//	}
//	
//	@Override
//	public Cafe selectCafe(int id) {
//		Cafe cafe=null;
//		Connection conn=null;
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		String sql="select * from cafe where cafe_id=?";
//		try {
//			conn=ds.getConnection();
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setInt(1, id);
//			rs=pstmt.executeQuery();
//			if(rs.next()) {
//				cafe=new Cafe();
//				cafe.setCafe_id(rs.getInt(1));
//				cafe.setCafe_name(rs.getString(2));
//				cafe.setCafe_img(rs.getString(3));
//				cafe.setCafe_info(rs.getString(4));
//				cafe.setCafe_num(rs.getInt(5));
//				cafe.setCafe_addr1(rs.getString(6));
//				cafe.setCafe_addr2(rs.getString(7));
//				cafe.setCafe_addr2(rs.getString(8));
//				cafe.setCafe_open(rs.getTime(9));
//			}
//		}catch(SQLException e){
//			return null;
//		}finally {
//			close(rs,pstmt,conn);
//		}
//		return cafe;
//	}
//	
//	private void close(AutoCloseable...acs) {
//		for(AutoCloseable ac:acs) {
//			try {
//				if(ac!=null)ac.close();
//			}
//			catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//	}
//	
	
	@Autowired
	SqlSession session;
	String namespace = "com.teamProject.cdcd.cafeMapper.";
	
	@Override
	public int insert(CafeDto cafeDto) throws Exception {
		return session.insert(namespace+"insert", cafeDto);
	}

	@Override
	public CafeDto selectCafe(Integer cafe_id) throws Exception {
		return session.selectOne(namespace+"selectCafe", cafe_id);
	}
	
	@Override
	public List<CafeDto> selectAll(SearchOption searchOption) throws Exception {
		return session.selectList(namespace+"selectAll", searchOption);
	}

	@Override
	public int cafeCount() throws Exception {
		return session.selectOne(namespace+"cafeCount");
	}
	
	@Override
	public List<CafeDto> search_K(SearchOption searchOption) throws Exception {
		return session.selectList(namespace+"search_K", searchOption);
	}

	@Override
	public int update(CafeDto cafeDto) throws Exception {
		return session.update(namespace+"update", cafeDto);
	}

    @Override
    public int delete(Integer cafe_id) throws Exception {
        return session.delete(namespace+"delete", cafe_id);
    }
    
}
