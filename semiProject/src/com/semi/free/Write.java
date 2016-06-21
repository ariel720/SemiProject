package com.semi.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.FreeDAO;
import com.semi.dto.FreeDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Write implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		FreeDTO fr= new FreeDTO();
		
		fr.setId(request.getParameter("id"));
		fr.setTitle(request.getParameter("title"));
		fr.setContents(request.getParameter("smarteditor"));
		
		FreeDAO fdao=new FreeDAO();
		int resutl=fdao.write(fr);
		
		ActionForward af= new ActionForward();
		String msg=null;
		
		if(resutl>0){
			msg="글쓰기 성공";
			af.setIscheck(true);
			af.setPath("/free/result.jsp");
			
			request.setAttribute("msg", msg);
			
		}else{
			msg="글쓰기 실패";
			af.setIscheck(false);
			af.setPath("/free/result.jsp");
			request.setAttribute("msg", msg);
			
		}
		
		return af;
	}

	
	
}
