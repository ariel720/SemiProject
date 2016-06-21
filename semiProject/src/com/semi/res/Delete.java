package com.semi.res;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.ResDAO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Delete implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {

		
		int res_num=Integer.parseInt(request.getParameter("res_num"));
		
		ResDAO rdao=new ResDAO();
int result=rdao.delete(res_num);
		
		ActionForward af= new ActionForward();
		String msg=null;
		
		if(result>0){
			af.setIscheck(true);
			af.setPath("/res/result.jsp");
			
			msg="삭제 성공";			
			request.setAttribute("msg", msg );
			
		}else{
			af.setIscheck(false);
			af.setPath("/res/result.jsp");
			
			msg="삭제 실패";			
			request.setAttribute("msg", msg );
			
		}

		
		return af;
	}

}
