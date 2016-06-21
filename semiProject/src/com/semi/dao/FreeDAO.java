package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.dto.FreeDTO;
import com.semi.dto.NoticeDTO;
import com.semi.util.DBConPool;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;





public class FreeDAO {

	
	//원본 글 저장하는 메소드
	public int write( FreeDTO fr){
		
		
		Connection con= DBConPool.getcon();
		
		String sql="insert into free values(f_seq.nextVal,?,?,?,0,sysdate)";
		
		PreparedStatement st= null;
		int result=0;
		
		try {
			st=con.prepareStatement(sql);
			
			st.setString(1, fr.getId());
			st.setString(2, fr.getTitle());
			st.setString(3, fr.getContents());

			result=st.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
		DBConPool.discon(con, st);			
		}
		return result;
		
	}
	
	//원본글 하나 불러오는 메소드
	public FreeDTO view(int num){
		
		
		Connection con= DBConPool.getcon();
		String sql="select * from free where num=?";
		
		PreparedStatement st= null;
		ResultSet rs= null;
		
		FreeDTO fr=new FreeDTO();
		
		try {
			st=con.prepareStatement(sql);
			st.setInt(1, num);
			
			rs=st.executeQuery();
			
			if(rs.next()){
				fr.setContents(rs.getString("contents"));
				fr.setCounts(rs.getInt("counts")+1);
				fr.setId(rs.getString("id"));
				fr.setNum(rs.getInt("num"));
				fr.setReg_date(rs.getDate("reg_date"));
				fr.setTitle(rs.getString("title"));
				
				
				
				update(fr);
			}else{
				fr=null;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);
		}
		return fr;
		
	}

	//원본글 삭제하는 메소드
	
	public int delete(int num){
		
		Connection con= DBConPool.getcon();
		String sql="delete from free where num=?";
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
		
		//글 업데이트 하는 메소드
		
	public int update(FreeDTO fr){
		
		Connection con=DBConPool.getcon();
		String sql="update free set title=?,contents=?, counts=? where num=?";
		
		PreparedStatement st= null;
		int result=0;
		
		try {
			st=con.prepareStatement(sql);
			st.setString(1, fr.getTitle());
			st.setString(2, fr.getContents());
			st.setInt(3, fr.getCounts());
			st.setInt(4, fr.getNum());
			
			result=st.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(con, st);
		}
		return result;
	}
	
	//글 하나 보는 메소드
	
	private int perblock=5;
	private int perpage=10;
	
	//원본글(step=0) 리스트 가져오는 메소드	
	public ArrayList<FreeDTO> list(int cp){
		
	ArrayList<FreeDTO> al= new ArrayList<>();
		Connection con= DBConPool.getcon();
		
		String sql="select * from (select rownum R,A.*from (select * from free order by num desc ) A )where R between ? and ?";
		
	PreparedStatement st= null;
	ResultSet rs= null;
	
	try {
		st=con.prepareStatement(sql);
		
		st.setInt(1, (cp-1)*perpage+1);
		st.setInt(2, cp*perpage);
		
		rs=st.executeQuery();
		
		while(rs.next()){
			
			FreeDTO fr= new FreeDTO();
			
			fr.setContents(rs.getString("contents"));
			fr.setCounts(rs.getInt("counts"));
			fr.setId(rs.getString("id"));
			fr.setNum(rs.getInt("num"));
			fr.setReg_date(rs.getDate("reg_date"));
			fr.setTitle(rs.getString("title"));
			
			al.add(fr);	
			
			
		}

	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBConPool.discon(rs, con, st);
	}
	
	return al;
		
		
	}
	
	
	//토탈리스트메소드
	public int totallist(){
		int totallist=0;
		
		Connection con= DBConPool.getcon();
		
		String sql="select count(num) from free";
		
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
		System.out.println(totallist);
		return totallist;
		
	}
	//페이징 메소드
	
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
		
		if(cblock==ttblock){
			lastp=ttpage;
		}else{
			lastp=cblock*perblock;
		}
		
		System.out.println(startp);
		System.out.println(lastp);
		HashMap<String, Integer> hs=new HashMap<>();
		hs.put("ttblock", ttblock);
		hs.put("cblock", cblock);
		hs.put("startp", startp);
		hs.put("lastp", lastp);
		
		return hs;
	}
	
	//내가 쓴 글 가져오기
	public ArrayList<FreeDTO> myWriteList(String id, int cp){
		Connection con = DBConPool.getcon();
		
		String sql = "select * from (select rownum R,A.*from (select * from free where id=? order by num desc ) A )where R between ? and ?";
		
		PreparedStatement st = null;
		ResultSet rs = null;
		
		ArrayList<FreeDTO> alf = new ArrayList<>();
		
		try {
			
			st = con.prepareStatement(sql);
			st.setString(1, id);
			st.setInt(2, (cp-1)*perpage+1);
			st.setInt(3, cp*perpage);
			
			rs = st.executeQuery();
			
			while(rs.next()){
				FreeDTO freeDTO = new FreeDTO();
				
				freeDTO.setNum(rs.getInt("num"));
				freeDTO.setId(rs.getString("id"));
				freeDTO.setTitle(rs.getString("title"));
				freeDTO.setCounts(rs.getInt("counts"));
				freeDTO.setReg_date(rs.getDate("reg_date"));
				
				alf.add(freeDTO);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConPool.discon(rs, con, st);
		}
		return alf;
	}

}
