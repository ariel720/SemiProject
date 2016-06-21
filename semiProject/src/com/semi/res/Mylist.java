package com.semi.res;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MemDAO;
import com.semi.dao.ResDAO;
import com.semi.dto.MemDTO;
import com.semi.dto.ResDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;
import com.sun.media.sound.RealTimeSequencerProvider;

public class Mylist implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af= new ActionForward();
		
		int cp=Integer.parseInt(request.getParameter("cp"));
	String id=request.getParameter("id");
		
	
		MemDAO mdao=new MemDAO();
	
		MemDTO mem=mdao.meminfo(id);
		
		
		request.setAttribute("mem", mem);
		
		af.setIscheck(true);
		af.setPath("/res/meminfo.jsp");
			
		return af;
	}

}
