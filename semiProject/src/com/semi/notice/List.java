package com.semi.notice;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.NoticeDAO;
import com.semi.dto.NoticeDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class List implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af= new ActionForward();
		
		int cp=Integer.parseInt(request.getParameter("cp"));
		
		NoticeDAO ndDao=new NoticeDAO();
		
		ArrayList<NoticeDTO> al=ndDao.list(cp);//글목록
		HashMap<String, Integer> hs=ndDao.paging(cp); //페이징
		
		
		request.setAttribute("ntal", al);
		request.setAttribute("nths", hs);
		
		af.setIscheck(true);
		af.setPath("/notice/list.jsp");
			
		return af;
	}

}
