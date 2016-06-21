package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.semi.dto.GalCatReplyDTO;
import com.semi.dto.GalHoReplyDTO;
import com.semi.util.DBConPool;

public class GalCatReplyDAO {
	//update
		public GalCatReplyDTO replyUpdate(GalCatReplyDTO grdto){
			int result = 0;
			Connection con = DBConPool.getcon();
			ResultSet rs = null;
			PreparedStatement st = null;
			String sql ="update galcatreply set contents=? where num=? and ref=?";
			
			try {
				st =con.prepareStatement(sql);
				st.setString(1, grdto.getContents());
				st.setInt(2, grdto.getNum());
				st.setInt(3, grdto.getRef());
				result = st.executeUpdate();
				
				sql="select * from galcatreply where num=? and ref=?";
				
				st=con.prepareStatement(sql);
				
				st.setInt(1, grdto.getNum());
				st.setInt(2, grdto.getRef());
				rs = st.executeQuery();
				
				if(rs.next()){
					grdto.setNum(rs.getInt("num"));
					grdto.setId(rs.getString("id"));
					grdto.setContents(rs.getString("contents"));
					grdto.setReg_date(rs.getDate("reg_date"));
					grdto.setRef(rs.getInt("ref"));
				}else{
					grdto=null;
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBConPool.discon(rs, con, st);
			}
			
			
			return grdto;
		}
		
		//delete
		public int replyDel(int num){
			int result =0;
			Connection con = DBConPool.getcon();
			PreparedStatement st = null;
			
			String sql ="delete galcatreply where num=?";
			try {
				st = con.prepareStatement(sql);
				st.setInt(1, num);
				result = st.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBConPool.discon(con, st);
			}
			
			return result;
			
		}
		
		//list
		public ArrayList<GalCatReplyDTO> replyList( int num){
			Connection con = DBConPool.getcon();
			PreparedStatement st = null;
			ResultSet rs = null;
			String sql ="SELECT * from galcatreply where ref=? order by num";
			ArrayList<GalCatReplyDTO> ar = new ArrayList<>();
			try {
				st = con.prepareStatement(sql);
				st.setInt(1, num);
				rs =st.executeQuery();
				while(rs.next()){
					GalCatReplyDTO grdto = new GalCatReplyDTO();
					
					grdto.setNum(rs.getInt("num"));
					grdto.setId(rs.getString("id"));
					grdto.setContents(rs.getString("contents"));
					grdto.setReg_date(rs.getDate("reg_date"));
					grdto.setRef(rs.getInt("ref"));
					
					ar.add(grdto);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBConPool.discon(rs, con, st);
			}
			return ar;
		}
		
		//write
		public GalCatReplyDTO replyWrite(GalCatReplyDTO grdto){
			Connection con = DBConPool.getcon();
			PreparedStatement st = null;
			int result =0;
			ResultSet rs = null;
			String sql="Insert into galcatreply values(galcatreply_seq.nextVal,?,?,sysdate,?)";
			
			try {
				st = con.prepareStatement(sql);
				st.setString(1, grdto.getId());
				st.setString(2, grdto.getContents());
				st.setInt(3, grdto.getRef());
				
				result = st.executeUpdate();
				if(result>0){
					sql="select max(num) from galcatreply";
					st=con.prepareStatement(sql);
					rs = st.executeQuery();
					if(rs.next()){
						grdto.setNum(rs.getShort(1));
					}
					
					sql="select * From galcatreply where num=? and ref=?";
					st = con.prepareStatement(sql);
					st.setInt(1, grdto.getNum());
					st.setInt(2, grdto.getRef());
					rs=st.executeQuery();
					if(rs.next()){
						grdto.setNum(rs.getInt("num"));
						grdto.setId(rs.getString("id"));
						grdto.setContents(rs.getString("contents"));
						grdto.setReg_date(rs.getDate("reg_date"));
						grdto.setRef(rs.getInt("ref"));
						
					}else{
						grdto=null;
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBConPool.discon(rs, con, st);
			}
			return grdto;
		}
}
