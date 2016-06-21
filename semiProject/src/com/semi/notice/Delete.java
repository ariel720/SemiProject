package com.semi.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.NoticeDAO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Delete implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		NoticeDAO ndao= new NoticeDAO();
		
		int result=ndao.delete(num);
		
		ActionForward af= new ActionForward();
		String msg=null;
		
		if(result>0){
			af.setIscheck(true);
			af.setPath("/notice/result.jsp");
			
			msg="삭제 성공";			
			request.setAttribute("msg", msg );
			
		}else{
			af.setIscheck(false);
			af.setPath("/notice/result.jsp");
			
			msg="삭제 실패";			
			request.setAttribute("msg", msg );
			
		}

		return af;
	}

}
