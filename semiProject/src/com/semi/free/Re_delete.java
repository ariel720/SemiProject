package com.semi.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.ReplyDAO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Re_delete implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af= new ActionForward();
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		ReplyDAO rdao=new ReplyDAO();
		int result=rdao.delete(num);
		String msg=null;
		
		if(result>0){
			af.setIscheck(true);
			af.setPath("/free/result.jsp");
			
			msg="삭제 성공";			
			request.setAttribute("msg", msg );
		}else{
			af.setIscheck(false);
			af.setPath("/free/result.jsp");
			
			msg="삭제 실패";			
			request.setAttribute("msg", msg );
		}

		
		return af;
	}

}
