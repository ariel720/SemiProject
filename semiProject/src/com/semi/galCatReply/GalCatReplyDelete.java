package com.semi.galCatReply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalCatReplyDAO;
import com.semi.dao.GalHoReplyDAO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalCatReplyDelete implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String ref = request.getParameter("ref");
		
		GalCatReplyDAO grdao=new GalCatReplyDAO();
		int result = grdao.replyDel(num);
		ActionForward af = new ActionForward();
		
		af.setIscheck(true);
		af.setPath("/galCat/galCatReplyList.gcre?num="+ref);
		
		return af;
	}

}
