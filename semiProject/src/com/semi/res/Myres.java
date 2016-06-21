package com.semi.res;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.ResDAO;
import com.semi.dto.ResDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Myres implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af= new ActionForward();
		
		
		String id= request.getParameter("id");
		
		
		ResDAO rdao= new ResDAO();
		
		ArrayList<ResDTO> al=rdao.mylist(id);
		
		request.setAttribute("al", al);
		
		af.setIscheck(true);
		af.setPath("/res/myres.jsp");
		
		return af;
	}

}
