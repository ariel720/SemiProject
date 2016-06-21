package com.semi.res;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.FreeDAO;
import com.semi.dao.ResDAO;
import com.semi.dto.FreeDTO;
import com.semi.dto.MemDTO;
import com.semi.dto.ResDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

import oracle.net.aso.s;

public class List_m implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		ResDTO resDTO = new ResDTO();
		ResDAO resDAO = new ResDAO();
		FreeDTO freeDTO = new FreeDTO();
		FreeDAO freeDAO = new FreeDAO();
		HttpSession session = request.getSession();
		int cp = Integer.parseInt(request.getParameter("cp"));
		
		String id = ((MemDTO)session.getAttribute("member")).getId();
		
		ArrayList<ResDTO> ad = resDAO.mylist(id);
		ArrayList<FreeDTO> afd = freeDAO.myWriteList(id, cp);
		
		HashMap<String, Integer> has = freeDAO.paging(cp);
		
		request.setAttribute("myRes", ad);
		request.setAttribute("myWriteList", afd);
		request.setAttribute("myListV", has);
		
		af.setIscheck(true);
		af.setPath("/mem/myRes.jsp");
		
		return af;
	}
	
}
