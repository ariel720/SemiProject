package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.dto.NoticeDTO;
import com.semi.util.DBConPool;

public class NoticeDAO {

	//글 하나 저장하는 메소드
	
	
public int write(NoticeDTO nt){

	Connection con = DBConPool.getcon();
	
	String sql="insert into notice values (n_seq.nextVal,?,?,?,0,sysdate)";
	
	PreparedStatement st=null;
	int result=0;
	try {
		st=con.prepareStatement(sql);
		st.setString(1, nt.getId());
		st.setString(2, nt.getTitle());
		st.setString(3, nt.getContents());
		
		result=st.executeUpdate();
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBConPool.discon(con, st);
	}
	
	
	return result; 
}
	
	//글 하나 보여주는 메소드
public NoticeDTO view(int num){
	
	Connection con= DBConPool.getcon();
	String sql="select * from notice where num=?";
	
	PreparedStatement st= null;
	ResultSet rs= null;
	
	NoticeDTO nt=new NoticeDTO();
	
	try {
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		
		rs=st.executeQuery();
		
		if(rs.next()){
			nt.setContents(rs.getString("contents"));
			nt.setCounts(rs.getInt("counts")+1);
			nt.setId(rs.getString("id"));
			nt.setNum(rs.getInt("num"));
			nt.setReg_date(rs.getDate("reg_date"));
			nt.setTitle(rs.getString("title"));
			
			/*sql="update notice set counts=? where num=?";
			st.setInt(1, nt.getCounts());
			st.setInt(2, nt.getNum());
			st.executeUpdate();*/
			
			update(nt);
		}else{
			nt=null;
		}
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBConPool.discon(rs, con, st);
	}
	return nt;
	
	
}
	
	
	//글 삭제하는 메소드
public int delete(int num){
	
	Connection con= DBConPool.getcon();
	String sql="delete from notice where num=?";
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
	
public int update(NoticeDTO nt){
	
	Connection con=DBConPool.getcon();
	String sql="update notice set title=?,contents=?, counts=? where num=?";
	
	PreparedStatement st= null;
	int result=0;
	
	try {
		st=con.prepareStatement(sql);
		st.setString(1, nt.getTitle());
		st.setString(2, nt.getContents());
		st.setInt(3, nt.getCounts());
		st.setInt(4, nt.getNum());
		
		result=st.executeUpdate();
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBConPool.discon(con, st);
	}
	return result;
}





private int perblock=5;
private int perpage=10;

	//글 리스트 가져오는 메소드	
public ArrayList<NoticeDTO> list(int cp){
	
	ArrayList<NoticeDTO> al= new ArrayList<>();
	
	Connection con= DBConPool.getcon();
	String sql="select * from (select rownum R,A.*from (select * from notice order by num desc ) A ) where R between ? and ?";
	PreparedStatement st= null;
	ResultSet rs= null; 
	
	try {
		st=con.prepareStatement(sql);
		st.setInt(1, (cp-1)*perpage+1);
		st.setInt(2, cp*perpage);
		
		rs=st.executeQuery();
		
		while(rs.next()){
			
			NoticeDTO nt=new NoticeDTO();
			nt.setContents(rs.getString("contents"));
			nt.setCounts(rs.getInt("counts"));
			nt.setId(rs.getString("id"));
			nt.setNum(rs.getInt("num"));
			nt.setReg_date(rs.getDate("reg_date"));
			nt.setTitle(rs.getString("title"));
			
			al.add(nt);	
			
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBConPool.discon(rs, con, st);;
	}

	return al;
}




//토탈리스트 가져오는 메소드
	
public int totallist(){
	int totallist=0;
	
	Connection con= DBConPool.getcon();
	
	String sql="select count(num) from notice";
	
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
/*
 int perblock=5;
 int perpage=10;
*/
	//글 페이징 메소드
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
