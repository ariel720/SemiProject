package com.semi.mem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MemDAO;
import com.semi.dto.MemDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class IdCheck implements Action {

	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		System.out.println(id);
		MemDAO memDAO = new MemDAO();
		String check = memDAO.idCheck(id);
		ActionForward af = new ActionForward();
		System.out.println(check);
		request.setAttribute("check", check);
		af.setIscheck(true);
		af.setPath("/mem/idCheck.jsp");
		return af;
	}
	
}
