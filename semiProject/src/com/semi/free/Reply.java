package com.semi.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.FreeDAO;
import com.semi.dao.ReplyDAO;
import com.semi.dto.FreeDTO;
import com.semi.dto.ReplyDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Reply implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
	
		ActionForward af= new ActionForward();
		
		
		ReplyDTO re=new ReplyDTO();
		re.setId(request.getParameter("id"));
		re.setContents(request.getParameter("contents"));
		re.setRef(Integer.parseInt(request.getParameter("ref")));
		
		ReplyDAO rdao= new ReplyDAO();
		int result =rdao.setReply(re);
		
		request.setAttribute("reply", re);
		af.setIscheck(true);
		af.setPath("/free/result_re.jsp");
	
		return af;
	}

}
