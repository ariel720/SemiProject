package com.semi.galHoReply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalHoReplyDAO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalHoReplyDelete implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String ref = request.getParameter("ref");
		
		GalHoReplyDAO grdao=new GalHoReplyDAO();
		int result = grdao.replyDel(num);
		ActionForward af = new ActionForward();
		
		af.setIscheck(true);
		af.setPath("/galHo/galHoReplyList.ghre?num="+ref);
		
		return af;
	}

}
