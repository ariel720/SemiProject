package com.semi.galCatReply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalCatReplyDAO;
import com.semi.dao.GalHoReplyDAO;
import com.semi.dto.GalCatReplyDTO;
import com.semi.dto.GalHoReplyDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalCatReplyUpdate implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalCatReplyDTO grdto = new GalCatReplyDTO();
		grdto.setContents(request.getParameter("contents"));
		grdto.setNum(Integer.parseInt(request.getParameter("num")));
		grdto.setRef(Integer.parseInt(request.getParameter("ref")));
		GalCatReplyDAO grdao = new GalCatReplyDAO();
		grdto = grdao.replyUpdate(grdto);
		
		ActionForward af = new ActionForward();
		af.setIscheck(true);
		af.setPath("/galCat/galCatReplyList.gcre?num="+grdto.getRef());
		
		return af;
	}

}
