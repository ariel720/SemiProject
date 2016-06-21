package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.dto.GalCatDTO;
import com.semi.dto.GalHoDTO;
import com.semi.util.DBConPool;

public class GalCatDAO {
	private final int PER_PAGE=12;
	//recount
		public int replyCount(int num){
			int result=0;
			Connection con = DBConPool.getcon();
			ResultSet rs =null;
			PreparedStatement st = null;
			String sql ="select count(*) from galcatreply where ref=?";
			
			try {
				st = con.prepareStatement(sql);
				st.setInt(1, num);
				rs = st.executeQuery();
				if(rs.next()){
					result = rs.getInt(1);
				}else{
					result=0;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBConPool.discon(rs, con, st);
			}
			
			
			
			return result;
		}
	
	//delete
	public int galCatDelete(GalCatDTO gdto){
		Connection con = DBConPool.getcon();
		int result = 0;
		PreparedStatement st =null;
		String sql="delete galcat where num=?";
		
		try {
			st=con.prepareStatement(sql);
			st.setInt(1, gdto.getNum());
			
			result=st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConPool.discon(con, st);
		}
		return result;
	}
	
	//update
	
	public int galCatUpdate(GalCatDTO gdto){
		Connection con = DBConPool.getcon();
		int result =0;
		PreparedStatement st=null;
		
		String sql="update galcat set title=?, contents=?, imagefile=? where num=?";
		
		try {
			st = con.prepareStatement(sql);
			st.setString(1, gdto.getTitle());
			st.setString(2, gdto.getContents());
			st.setString(3,gdto.getImagefile());
			st.setInt(4, gdto.getNum());
			
			result = st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConPool.discon(con, st);
		}
		
		return result;
	}
	
	//view
	public GalCatDTO galCatview(GalCatDTO gdto){
		Connection con = DBConPool.getcon();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql= "select * from galcat where num=?";
		
		try {
			st = con.prepareStatement(sql);
			st.setInt(1,gdto.getNum());
			
			rs = st.executeQuery();
			if(rs.next()){
				gdto.setNum(rs.getInt("num"));
				gdto.setId(rs.getString("id"));
				gdto.setTitle(rs.getString("title"));
				gdto.setContents(rs.getString("contents"));
				gdto.setCounts(rs.getInt("counts")+1);
				gdto.setImagefile(rs.getString("imagefile"));
				gdto.setReg_date(rs.getDate("reg_date"));
				
				sql="update galcat set counts=? where num=?";
				
				st= con.prepareStatement(sql);
				st.setInt(1, gdto.getCounts());
				st.setInt(2, gdto.getNum());
				st.executeUpdate();
				
			}else{
				gdto =  null;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConPool.discon(rs, con, st);
		}
		return gdto;
	}
	
	
	//List
	public ArrayList<GalCatDTO> galCatList(int curPage, String sort, String search){
		Connection con = DBConPool.getcon();
		int startNum = (curPage-1)*PER_PAGE+1;
		int lastNum = curPage*PER_PAGE;
		ArrayList<GalCatDTO> ar = new ArrayList<>();
		PreparedStatement st=null;
		ResultSet rs = null;
		String sql="select * from "
				+ "(select rownum r, a.* from "
				+ "(select * from galCat order by num desc) a) ";
		if(sort != null && search != null){
			sql +="where r between ? and ? and "+sort+" like '%"+search+"%' ";
		}else{
			sql+="where r between ? and ?";
		}
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, startNum);
			st.setInt(2, lastNum);
			
			rs = st.executeQuery();
			while(rs.next()){
				GalCatDTO gdto = new GalCatDTO();
				gdto.setNum(rs.getInt("num"));
				gdto.setTitle(rs.getString("title"));
				gdto.setContents(rs.getString("contents"));
				gdto.setCounts(rs.getInt("counts"));
				gdto.setId(rs.getString("id"));
				gdto.setReg_date(rs.getDate("reg_date"));
				gdto.setImagefile(rs.getString("imagefile"));
				gdto.setRe_counts(replyCount(rs.getInt("num")));
				ar.add(gdto);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConPool.discon(rs, con, st);
		}
		return ar;
		
	}
	
	//총 리스트
	private int getTotalList(){
		int result =0;
		Connection con = DBConPool.getcon();
		
		PreparedStatement st = null;
		ResultSet rs= null;
		
		String sql = "select count(*) from galCat";
		
		try {
			st = con.prepareStatement(sql);
			rs =st.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);
		}
		return result;
	}
	//페이징
	public HashMap<String, Integer> galCatPage(int curPage){
		int totalList=0;
		totalList = getTotalList();
		int totalPage=0;
		if(totalList%PER_PAGE==0){
			totalPage= totalList/PER_PAGE;
		}else{
			totalPage= totalList/PER_PAGE+1;
		}
		
		int curBlock=0;
		int perBlock=5;
		int totalBlock=0;
		if(totalPage%perBlock==0){
			totalBlock=totalPage/perBlock;
		}else{
			totalBlock=totalPage/perBlock+1;
		}
		
		if(curPage%perBlock==0){
			curBlock = curPage/perBlock;
		}else{
			curBlock = curPage/perBlock+1;
		}
		
		int startNum = (curBlock-1)*perBlock+1;
		int lastNum = curBlock*perBlock;
		
		if(curBlock==totalBlock){
			lastNum = totalPage;
		}
		
		HashMap<String, Integer> hs = new HashMap<>();
		hs.put("lastNum",lastNum );
		hs.put("startNum", startNum);
		hs.put("curBlock", curBlock);
		hs.put("totalBlock",totalBlock);
		hs.put("totalList",totalList);
		return hs;
	}
	
	
	
	public int writeGal(GalCatDTO gdto){
		Connection con = DBConPool.getcon();
		
		PreparedStatement st = null;
		int result = 0;
		
		String sql = "insert into galCat values(galcat_seq.nextVal,?,?,?,0,sysdate,?)";
		
		try {
			st = con.prepareStatement(sql);
			
			st.setString(1, gdto.getId());
			st.setString(2, gdto.getTitle());
			st.setString(3, gdto.getContents());
			st.setString(4, gdto.getImagefile());
			result = st.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(con, st);
		}
		
		return result;	
		
	}
}
