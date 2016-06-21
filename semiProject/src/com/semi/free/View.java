package com.semi.free;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.FreeDAO;
import com.semi.dao.NoticeDAO;
import com.semi.dao.ReplyDAO;
import com.semi.dto.FreeDTO;
import com.semi.dto.NoticeDTO;
import com.semi.dto.ReplyDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class View implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		int check=Integer.parseInt(request.getParameter("check"));
		
		FreeDAO fdao= new FreeDAO();
		FreeDTO fr=new FreeDTO();
		fr=fdao.view(num);
		request.setAttribute("fr", fr);
		
		ReplyDAO rdao=new ReplyDAO();
		ArrayList<ReplyDTO> al = rdao.getReply(num);
		request.setAttribute("re_al", al);
		
		
		ActionForward af= new ActionForward();
		String msg=null;	
		
		 if(fr == null){
			 af.setIscheck(false);
				af.setPath("/free/result.jsp");
				
				msg="글을 불러올 수 없습니다.";			
				request.setAttribute("msg", msg );
			 
		 }else{
			 
			 if(check==1){
				 af.setIscheck(true);
					af.setPath("/free/update.jsp");	 
				 
			 }else{
			 af.setIscheck(true);
				af.setPath("/free/view.jsp");
			 }
		 }
		
		
			return af;
	}

}
