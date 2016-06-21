package com.semi.galHoReply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalHoReplyDAO;
import com.semi.dto.GalHoReplyDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalHoReplyUpdate implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalHoReplyDTO grdto = new GalHoReplyDTO();
		grdto.setContents(request.getParameter("contents"));
		grdto.setNum(Integer.parseInt(request.getParameter("num")));
		grdto.setRef(Integer.parseInt(request.getParameter("ref")));
		GalHoReplyDAO grdao = new GalHoReplyDAO();
		grdto = grdao.replyUpdate(grdto);
		System.out.println(grdto.getContents());
		ActionForward af = new ActionForward();
		af.setIscheck(true);
		af.setPath("/galHo/galHoReplyList.ghre?num="+grdto.getRef());
		
		return af;
	}

}
