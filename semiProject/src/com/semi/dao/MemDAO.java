package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.semi.dto.MemDTO;
import com.semi.util.DBConPool;

import oracle.jdbc.driver.DBConversion;

public class MemDAO {
//회원정보 - 신희
	public MemDTO meminfo(String id){
		
		
		
		Connection con = DBConPool.getcon();
		
		String sql = "select * from mem where id=?";
		
		
		PreparedStatement st = null;
		ResultSet rs = null;
		
		MemDTO memDTO= new MemDTO();
		try {
			st = con.prepareStatement(sql);			
			st.setString(1, id);			
			rs = st.executeQuery();
						
			if(rs.next()){
				memDTO.setId(rs.getString("id"));
				memDTO.setName(rs.getString("name"));
				memDTO.setEmail_01(rs.getString("email_01"));
				memDTO.setEmail_02(rs.getString("email_02"));
				memDTO.setPhone_01(rs.getString("phone_01"));
				memDTO.setPhone_02(rs.getString("phone_02"));
				memDTO.setPhone_03(rs.getString("phone_03"));
								
			}else{
				memDTO=null;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);
		}
		
		return memDTO;
	}
	
	
	//회원수
	public void memCheck(){
		Connection con = DBConPool.getcon();
		
		String sql = "select count(*) from mem";
		
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			st = con.prepareStatement(sql);
			
			rs = st.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);
		}
	}
	
	//id check
	public String idCheck(String id){
		Connection con = DBConPool.getcon();
		String sql = "select * from mem where id=?";
		PreparedStatement st = null;
		ResultSet rs = null;
		String result = "";
		
		try {
			st = con.prepareStatement(sql);
			st.setString(1, id);
			
			rs = st.executeQuery();
			
			if(rs.next()){
				result = "no";
			}else{
				result = "ok";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);
		}
		return result;
	}

	//로그인
	public MemDTO Login(MemDTO memDTO){
		Connection con = DBConPool.getcon();
		
		String sql = "select * from mem where id=? and pw=?";
		
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			st = con.prepareStatement(sql);
			st.setString(1, memDTO.getId());
			st.setString(2, memDTO.getPw());
			
			rs = st.executeQuery();
			
			if(rs.next()){
				memDTO.setName(rs.getString("name"));
				memDTO.setEmail_01(rs.getString("email_01"));
				memDTO.setEmail_02(rs.getString("email_02"));
				memDTO.setPhone_01(rs.getString("phone_01"));
				memDTO.setPhone_02(rs.getString("phone_02"));
				memDTO.setPhone_03(rs.getString("phone_03"));
			}else{
				memDTO = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);
		}
		return memDTO;
	}

	//회원가입
	public int joins(MemDTO memDTO){
		Connection con = DBConPool.getcon();
		
		String sql = "insert into mem values(?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement st = null;
		int result = 0;

		try {
			st = con.prepareStatement(sql);
			st.setString(1, memDTO.getId());
			st.setString(2, memDTO.getPw());
			st.setString(3, memDTO.getName());
			st.setString(4, memDTO.getEmail_01());
			st.setString(5, memDTO.getEmail_02());
			st.setString(6, memDTO.getPhone_01());
			st.setString(7, memDTO.getPhone_02());
			st.setString(8, memDTO.getPhone_03());
			
			result = st.executeUpdate();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBConPool.discon(con, st);
		}
		return result;
	}
	
	//회원정보수정
	public int update(MemDTO memDTO){
		Connection con = DBConPool.getcon();
		
		String sql = "update mem set pw=?, email_01=?, email_02=?, phone_01=?, phone_02=?, phone_03=? where id=?";
		
		PreparedStatement st = null;
		int result = 0;
		
		try {
			st = con.prepareStatement(sql);
			st.setString(1, memDTO.getPw());
			st.setString(2, memDTO.getEmail_01());
			st.setString(3, memDTO.getEmail_02());
			st.setString(4, memDTO.getPhone_01());
			st.setString(5, memDTO.getPhone_02());
			st.setString(6, memDTO.getPhone_03());
			st.setString(7, memDTO.getId());
			
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConPool.discon(con, st);
		}
		return result;
	}
	
	//회원탈퇴
	public int delete(MemDTO memDTO){
		Connection con = DBConPool.getcon();
		
		String sql = "delete from mem where id=?";
		
		PreparedStatement st = null;
		int result = 0;
		
		try {
			st = con.prepareStatement(sql);
			st.setString(1, memDTO.getId());
			
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(con, st);
		}
		return result;
	}
}