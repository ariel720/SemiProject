package com.semi.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.NoticeDAO;
import com.semi.dto.NoticeDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class View implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
	int num=Integer.parseInt(request.getParameter("num"));
	
	
int check=Integer.parseInt(request.getParameter("check"));


	NoticeDAO ndao=new NoticeDAO();
	NoticeDTO nt= new NoticeDTO();
	
	nt=ndao.view(num);
	request.setAttribute("nt", nt);
	
	ActionForward af= new ActionForward();
	String msg=null;	
	
	 if(nt == null){
		 af.setIscheck(false);
			af.setPath("/notice/result.jsp");
			
			msg="글을 불러올 수 없습니다.";			
			request.setAttribute("msg", msg );
		 
	 }else{
		 
		 if(check==1){
			 af.setIscheck(true);
				af.setPath("/notice/update.jsp");
			 
		 }else{
			 			 
		 af.setIscheck(true);
			af.setPath("/notice/view.jsp");
		 }
		 
	 }
	
		return af;
	}

}
