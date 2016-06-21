package com.semi.res;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.NoticeDAO;
import com.semi.dao.ResDAO;
import com.semi.dto.NoticeDTO;
import com.semi.dto.ResDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class View implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		int res_num=Integer.parseInt(request.getParameter("res_num"));
		
		
		int check=Integer.parseInt(request.getParameter("check"));

		
		System.out.println(check);
		System.out.println(res_num);

			ResDAO rdao=new ResDAO();
			ResDTO res=new ResDTO();
			
			res=rdao.view(res_num);
			
			request.setAttribute("res", res);
			
			ActionForward af= new ActionForward();
			String msg=null;	
		
			 if(res == null){
				 af.setIscheck(false);
					af.setPath("/res/result.jsp");
					
					msg="글을 불러올 수 없습니다.";			
					request.setAttribute("msg", msg );
				 
			 }else{
				 
				 if(check==1){
					 af.setIscheck(true);
						af.setPath("/res/update.jsp");
					 
				 }else{
					 			 
				 af.setIscheck(true);
					af.setPath("/res/view.jsp");
				 }
				 
			 }
			
				return af;
			}
	}


