package com.semi.free;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.FreeDAO;
import com.semi.dao.NoticeDAO;
import com.semi.dto.FreeDTO;
import com.semi.dto.NoticeDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class List implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
ActionForward af= new ActionForward();
		
		int cp=Integer.parseInt(request.getParameter("cp"));
		
		FreeDAO fdao=new FreeDAO();
		
		ArrayList<FreeDTO> al=fdao.list(cp);
		HashMap<String, Integer> hs=fdao.paging(cp); //페이징
		
		
		request.setAttribute("fral", al);
		request.setAttribute("frhs", hs);
		
		af.setIscheck(true);
		af.setPath("/free/list.jsp");
			
		return af;
	}

}
