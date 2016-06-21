package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.dto.GraphdataDTO;
import com.semi.dto.NoticeDTO;
import com.semi.dto.ResDTO;
import com.semi.util.DBConPool;

public class ResDAO {
	
	//일별 예약몇건
	public int resOk(String s,int r){
		
		int cats=0;
		
		Connection con= DBConPool.getcon();
		String sql="select sum(cat_counts) from res where res_days like '%"+s+"%' and room_price=?";
		
		PreparedStatement st= null;
		ResultSet rs=null;
		
		try {
			st=con.prepareStatement(sql);
		
			st.setInt(1, r);
			
			rs=st.executeQuery();
			
			if(rs.next()){
			
			cats=rs.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);;
		}
		
		
		return cats;
		
	}
	
	//월예약현황(매출, 예약건수)

	public GraphdataDTO month_res(String month, int room_price){
		
		Connection con= DBConPool.getcon();

		
		String sql="select count(res_num) from res where res_days like '%"+month+"%' and room_price=?";
		String sql2="select sum(total_price) from res where res_days like '%"+month+"%' and room_price=?";
		
		PreparedStatement st= null;
		ResultSet rs=null;
		int total_res=0;
		int total_price=0;
		
		try {
			//=================================
			st=con.prepareStatement(sql);

			st.setInt(1, room_price);
			
              rs=st.executeQuery();
			
			rs.next();
			
			total_res=rs.getInt(1);
			
	//=====================================		
			st=con.prepareStatement(sql2);

			st.setInt(1, room_price);
			
              rs=st.executeQuery();
			
			rs.next();
			total_price=rs.getInt(1);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConPool.discon(rs, con, st);
		}
		
		GraphdataDTO gd=new GraphdataDTO();
		gd.setMonth(month);
		gd.setRes_counts(total_res);
		gd.setSales(total_price);
		
		return gd;
		
	}
	
	
	//예약저장
	public int setRes(ResDTO res){
		
		int result=0;
		Connection con =DBConPool.getcon();
		
		String sql ="insert into res values(?,?,?,?,?,?,?,?,?,res_seq.nextVal,?,?,?)";
		
		PreparedStatement st= null;
		
		
		try {
			st= con.prepareStatement(sql);
			
			st.setString(1, res.getId());
			st.setString(2, res.getR_name());
			st.setInt(3, res.getTime_counts());
			st.setInt(4, res.getRoom_price());;
			st.setInt(5, res.getCat_counts());
			st.setInt(6, res.getTotal_price());
			st.setString(7, res.getPh1());
			st.setString(8, res.getPh2());
			st.setString(9, res.getPh3());
			st.setTimestamp(10, res.getLast_day());
			st.setTimestamp(11, res.getStart_day());
			st.setString(12, res.getRes_days());
			
			
			result=st.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		finally{
			DBConPool.discon(con, st);
		}
		
		return result;
	}
	
	//예약 삭제
	public int delete(int res_num){
		
		Connection con= DBConPool.getcon();
		PreparedStatement st= null;
		String sql="delete from res where res_num=?";
		int result=0;
		try {
			st=con.prepareStatement(sql);
			
			st.setInt(1, res_num);
			
			result=st.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(con, st);
		}
		return result;
		
	}
	
	//예약업데이트
	
	public int update(ResDTO res){
		
		Connection con=DBConPool.getcon();
		String sql="update res set .......=? where res_num=?";
		
		PreparedStatement st= null;
		int result=0;
		
		try {
			st=con.prepareStatement(sql);
			
			//업데이트해야할 정보들 꺼내서 ?에 담기.
			
			st.setInt(2, res.getRes_num());
			
			result=st.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(con, st);
		}
		return result;
	}
	
	//예약 하나 불러오는 메소드
	
	public ResDTO view(int res_num){
		
		Connection con= DBConPool.getcon();
		String sql="select * from res where res_num=?";
		
		PreparedStatement st= null;
		ResultSet rs= null;
		
		ResDTO res=new ResDTO();
		
		try {
			st=con.prepareStatement(sql);
			st.setInt(1, res_num);
			
			rs=st.executeQuery();
			
			if(rs.next()){
			
				res.setCat_counts(rs.getInt("cat_counts"));
				res.setId(rs.getString("id"));
				res.setLast_day(rs.getTimestamp("last_day"));
				res.setPh1(rs.getString("ph1"));
				res.setPh2(rs.getString("ph2"));
				res.setPh3(rs.getString("ph3"));
				res.setR_name(rs.getString("r_name"));
				res.setRes_num(rs.getInt("res_num"));
				res.setRoom_price(rs.getInt("room_price"));
				res.setStart_day(rs.getTimestamp("start_day"));
				res.setTime_counts(rs.getInt("time_counts"));
				res.setTotal_price(rs.getInt("total_price"));
			
			}else{
				res=null;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);
		}
		return res;
				
	}
	
	
	private int perblock=5;
	private int perpage=10;
	
	//예약 리스트 불러오기
	public ArrayList<ResDTO> list(int cp){
		
		ArrayList<ResDTO> al= new ArrayList<>();
		
		Connection con= DBConPool.getcon();
		String sql="select * from (select rownum R,A.*from (select * from res order by res_num desc ) A ) where R between ? and ?";
		PreparedStatement st= null;
		ResultSet rs= null; 
		
		try {
			st=con.prepareStatement(sql);
			st.setInt(1, (cp-1)*perpage+1);
			st.setInt(2, cp*perpage);
			
			rs=st.executeQuery();
			
			while(rs.next()){
				
			ResDTO res=new ResDTO();
				
			res.setCat_counts(rs.getInt("cat_counts"));
			res.setId(rs.getString("id"));
			res.setLast_day(rs.getTimestamp("last_day"));
			res.setPh1(rs.getString("ph1"));
			res.setPh2(rs.getString("ph2"));
			res.setPh3(rs.getString("ph3"));
			res.setR_name(rs.getString("r_name"));
			res.setRes_num(rs.getInt("res_num"));
			res.setRoom_price(rs.getInt("room_price"));
			res.setStart_day(rs.getTimestamp("start_day"));
			res.setTime_counts(rs.getInt("time_counts"));
			res.setTotal_price(rs.getInt("total_price"));
			
				al.add(res);	
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);;
		}

		return al;
		
	}
	
	//아이디별 예약목록
	public ArrayList<ResDTO> mylist(String id){
		
		ArrayList<ResDTO> al= new ArrayList<>();
		
		Connection con= DBConPool.getcon();
		String sql="select * from res where id=? order by start_day desc";
		PreparedStatement st= null;
		ResultSet rs= null; 
		
		try {
			st=con.prepareStatement(sql);
			st.setString(1, id);
			
			rs=st.executeQuery();
			
			while(rs.next()){
				
			ResDTO res=new ResDTO();
				
			res.setCat_counts(rs.getInt("cat_counts"));
			res.setId(rs.getString("id"));
			res.setLast_day(rs.getTimestamp("last_day"));
			res.setPh1(rs.getString("ph1"));
			res.setPh2(rs.getString("ph2"));
			res.setPh3(rs.getString("ph3"));
			res.setR_name(rs.getString("r_name"));
			res.setRes_num(rs.getInt("res_num"));
			res.setRoom_price(rs.getInt("room_price"));
			res.setStart_day(rs.getTimestamp("start_day"));
			res.setTime_counts(rs.getInt("time_counts"));
			res.setTotal_price(rs.getInt("total_price"));
			
				al.add(res);	
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);;
		}

		return al;
		
	}
	
	
	//토탈리스트
	
	public int totallist(){
		int totallist=0;
		
		Connection con= DBConPool.getcon();
		
		String sql="select count(res_num) from res";
		
		PreparedStatement st= null;
		ResultSet rs=null;
		
		try {
			st=con.prepareStatement(sql);
			
			rs=st.executeQuery();
			
			rs.next();
			
			totallist=rs.getInt(1);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);;
		}
		
		return totallist;
		
	}
	
	//페이징
public HashMap<String, Integer> paging(int cp){
		
		int ttllist=totallist();
		
		//전체 페이지수
		int ttpage=0;
		
		if(ttllist%perpage==0){
			
			ttpage=ttllist/perpage;
			
		}else{
			ttpage=ttllist/perpage+1;
		}
		
		//전체 블럭수		
		int ttblock=0;
		
		
		if(ttpage%perblock==0){
			ttblock=ttpage/perblock;
		}else{
			ttblock=ttpage/perblock+1;
		}
			
		
		//현재 블럭번호
		int cblock=0;
		if(cp%perblock==0){
			cblock=cp/perblock;
			
		}else{
			cblock=cp/perblock+1;
		}
		
		
		//해당 블럭의 시작과 끝 페이지 번호
		int startp=(cblock-1)*perblock+1;
		int lastp=0;
		
		if(cblock==ttpage){
			lastp=ttpage;
		}else{
			lastp=cblock*perblock;
		}
		
		

		HashMap<String, Integer> hs=new HashMap<>();
		hs.put("ttblock", ttblock);
		hs.put("cblock", cblock);
		hs.put("startp", startp);
		hs.put("lastp", lastp);
		
		return hs;
}
	
	

}
