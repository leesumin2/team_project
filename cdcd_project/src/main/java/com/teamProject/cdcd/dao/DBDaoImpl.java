package com.teamProject.cdcd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.Member;


@Repository
public class DBDaoImpl implements DBDao {
	@Autowired
	DataSource ds;
	final int FALE=0;

	public ArrayList<Member> selectAll() {
		String sql="select * from member";
		ArrayList<Member> users = new ArrayList<>();
		Member user=null;
		try (
			Connection conn=ds.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
		){
			while(rs.next()) {
				user=new Member();
				user.setMem_id(rs.getString(1));
				user.setMem_pwd(rs.getString(2));
				user.setMem_email(rs.getString(3));
				user.setMem_phone(rs.getString(4));
			}
			return users;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public Member selectUser(String id) {
		Member user=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from member where mem_id=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				user=new Member();
				user.setMem_id(rs.getString(1));
				user.setMem_pwd(rs.getString(2));
				user.setMem_email(rs.getString(3));
				user.setMem_phone(rs.getString(4));
			}
		}catch(SQLException e){
			return null;
		}finally {
			close(rs,pstmt,conn);
		}
		return user;
	}
	@Override
	public Member selectUser2(String email) {
		Member user=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from member where mem_email=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				user=new Member();
				user.setMem_id(rs.getString(1));
				user.setMem_pwd(rs.getString(2));
				user.setMem_email(rs.getString(3));
				user.setMem_phone(rs.getString(4));
			}
		}catch(SQLException e){
			return null;
		}finally {
			close(rs,pstmt,conn);
		}
		return user;
	}
	

	@Override
	public int insertUser(Member user) {
		int rowCnt=FALE;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into member values(?,?,?,?)";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,user.getMem_id());
			pstmt.setString(2,user.getMem_pwd());
			pstmt.setString(3,user.getMem_email());
			pstmt.setString(4,user.getMem_phone());
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return FALE;
		}finally {
			close(pstmt,conn);
		}
	}

	@Override
	public int updateUser (Member user)  {
		int rowCnt=FALE;
		String sql = "update member set mem_pwd=?, mem_email=?, mem_phone=? where mem_id=?";
		try (
			Connection conn=ds.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
		){
			pstmt.setString(1, user.getMem_pwd());
			pstmt.setString(2, user.getMem_email());
			pstmt.setString(3, user.getMem_phone());
			pstmt.setString(4, user.getMem_id());
			rowCnt=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return FALE;
		}
		return rowCnt;
	}
	

	@Override
	public void deleteAll() throws Exception{
		Connection conn=ds.getConnection();
		String sql="delete from member";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
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
