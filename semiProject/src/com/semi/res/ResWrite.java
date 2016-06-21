package com.semi.res;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dto.ResDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class ResWrite implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward af =new ActionForward();
		
		ResDTO res=new ResDTO();
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		
		
		
		
		
		
		return af;
	}

	
	
	
	
}
