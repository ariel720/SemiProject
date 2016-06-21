package com.semi.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.NoticeDAO;
import com.semi.dto.NoticeDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Write implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		NoticeDTO nt = new NoticeDTO();
		nt.setId(request.getParameter("id"));
		nt.setTitle(request.getParameter("title"));
		nt.setContents(request.getParameter("smarteditor"));
		
		NoticeDAO ndao= new NoticeDAO();
		int result =ndao.write(nt);
		
		ActionForward af= new ActionForward();
		String msg=null;
		
		if(result>0){
			af.setIscheck(true);
			af.setPath("/notice/result.jsp");
			
			msg="글쓰기 성공";			
			request.setAttribute("msg", msg );
			
		}else{
			af.setIscheck(false);
			af.setPath("/notice/result.jsp");
			
			msg="글쓰기 실패";			
			request.setAttribute("msg", msg );
			
		}
		
		
		
		
		
		
		return af;
	}


}
