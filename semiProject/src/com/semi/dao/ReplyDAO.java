package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.dto.NoticeDTO;
import com.semi.dto.ReplyDTO;
import com.semi.util.DBConPool;

public class ReplyDAO {

	
	//저장 메소드
	public int setReply(ReplyDTO re){
		Connection con = DBConPool.getcon();
		String sql = "insert into reply values(re_seq.nextVal,?,sysdate,?,?)";
		PreparedStatement st = null;
		int result = 0;
		try {
			st = con.prepareStatement(sql);
			
			st.setString(1, re.getId());
			st.setString(2, re.getContents());
			st.setInt(3, re.getRef());
			
			result = st.executeUpdate();
		} catch ( Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
				
	}

	//수정
	
	
	//댓글 하나 가져오기
	public ReplyDTO one_re(int num){
		
	Connection con= DBConPool.getcon();
	String sql="select * from reply where num=?";
	
	PreparedStatement st= null;
	ResultSet rs= null;
	
	ReplyDTO re=new ReplyDTO();
	
	try {
		st=con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		rs=st.executeQuery();
		if(rs.next()){
			re.setId(rs.getString("id"));
			re.setContents(rs.getString("contents"));
						
		}else{
			re=null;
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBConPool.discon(rs, con, st);
	}
	return re;
	
	
	}
	
	
	//리스트 가져오기.
	public ArrayList<ReplyDTO> getReply(int num){
		Connection con = DBConPool.getcon();
		String sql = "select * from reply where ref=? order by num asc";
		PreparedStatement st = null;
		ResultSet rs = null;
		ArrayList<ReplyDTO> al = new ArrayList<>();
 		try {
			st = con.prepareStatement(sql);
			st.setInt(1, num);
			rs = st.executeQuery();
			
			while (rs.next()) {
				ReplyDTO re = new ReplyDTO();
				re.setNum(rs.getInt("num"));
				re.setId(rs.getString("id"));
				re.setContents(rs.getString("contents"));
				re.setRef(rs.getInt("ref"));
				re.setReg_date(rs.getDate("reg_date"));
				al.add(re);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConPool.discon(rs, con, st);
		}
 		return al;

	}
	
	//댓글 삭제
	public int delete(int num){
		
		Connection con= DBConPool.getcon();
		String sql="delete from reply where num=?";
		PreparedStatement st= null;
		int result=0;
		
		try {
			st=con.prepareStatement(sql);
			st.setInt(1, num);
			
			result=st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(con, st);
		}
		
		return result;
	}
		
		//댓글 업데이트 하는 메소드
		
	public ReplyDTO update(ReplyDTO re){
		
		Connection con=DBConPool.getcon();
		String sql="update reply set contents=? where num=?";
		
		PreparedStatement st= null;
		ResultSet rs= null;
		
		
		try {
			st=con.prepareStatement(sql);
			
			st.setString(1, re.getContents());
			st.setInt(2, re.getNum());
			
			rs=st.executeQuery();
			
			if(rs.next()){
				
				re.setId(rs.getString("id"));
				re.setRef(rs.getInt("ref"));
				re.setReg_date(rs.getDate("reg_date"));			
			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(con, st);
		}
		
		return re;
	}
	
	
}
