package com.semi.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.FreeDAO;
import com.semi.dto.FreeDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Update implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
	ActionForward af= new ActionForward();
	
	FreeDTO fr= new FreeDTO();
	
	fr.setContents(request.getParameter("smarteditor"));
	fr.setTitle(request.getParameter("title"));
	fr.setCounts(Integer.parseInt(request.getParameter("counts")));
	fr.setNum(Integer.parseInt(request.getParameter("num")));
	
	
	FreeDAO fdao= new FreeDAO();
	
	int result=fdao.update(fr);
	String msg = null;

	if (result > 0) {

		af.setIscheck(true);
		af.setPath("/free/result.jsp");

		msg = "업데이트 성공";
		request.setAttribute("msg", msg);

	} else {
		af.setIscheck(false);
		af.setPath("/free/result.jsp");

		msg = "업데이트 실패";
		request.setAttribute("msg", msg);

	}
	
		return af;
	}

}
