package com.semi.galCatReply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalCatReplyDAO;
import com.semi.dao.GalHoReplyDAO;
import com.semi.dto.GalCatReplyDTO;
import com.semi.dto.GalHoReplyDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalCatReplyList implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalCatReplyDTO grdto = new GalCatReplyDTO();
		GalCatReplyDAO grdao = new GalCatReplyDAO();
		int num =Integer.parseInt(request.getParameter("num"));
		//int curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<GalCatReplyDTO> ar = grdao.replyList(num);
		ActionForward af = new ActionForward();
		request.setAttribute("replyList", ar);
		
		af.setIscheck(true);
		af.setPath("/galCat/galCatReplyList.jsp");
		return af;
	}

}
