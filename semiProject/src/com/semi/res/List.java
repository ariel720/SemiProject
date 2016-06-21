package com.semi.res;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.NoticeDAO;
import com.semi.dao.ResDAO;
import com.semi.dto.NoticeDTO;
import com.semi.dto.ResDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class List implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
			ActionForward af= new ActionForward();
			
			int cp=Integer.parseInt(request.getParameter("cp"));
			
			ResDAO rdao=new ResDAO();
			String check="";
			check =request.getParameter("check");
			ArrayList<ResDTO> al=rdao.list(cp);//글목록
			HashMap<String, Integer> hs=rdao.paging(cp); //페이징
			
			
		
			
			request.setAttribute("resal", al);
			request.setAttribute("reshs", hs);
			
			af.setIscheck(true);
			if(check != null){
				af.setPath("/mem/myInfo.jsp");
				
			}else{
				
				af.setPath("/res/list.jsp");
			}
			/*af.setPath("/res/graph.jsp");*/
				
			return af;
	}

}
