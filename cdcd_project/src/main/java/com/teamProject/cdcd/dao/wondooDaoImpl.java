package com.teamProject.cdcd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.Wondoo;
@Repository
public class wondooDaoImpl implements wondooDao {
	@Autowired
	DataSource ds;
	@Override
	public Wondoo selectCoffeebean(String coffeebean_name) {
		Wondoo wd=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from coffeebean where coffeebean_name=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, coffeebean_name);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				wd=new Wondoo();
				wd.setCoffeebean_name(rs.getString(1));
				wd.setCoffeebean_img(rs.getString(2));
				wd.setCoffeebean_info(rs.getString(3));
			}
		}catch(SQLException e){
			return null;
		}finally {
			close(rs,pstmt,conn);
		}
		return wd;
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
