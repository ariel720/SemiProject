package com.semi.galHoReply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalHoReplyDAO;
import com.semi.dto.GalHoReplyDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalHoReplyList implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalHoReplyDTO grdto = new GalHoReplyDTO();
		GalHoReplyDAO grdao = new GalHoReplyDAO();
		int num =Integer.parseInt(request.getParameter("num"));
		//int curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<GalHoReplyDTO> ar = grdao.replyList(num);
		ActionForward af = new ActionForward();
		request.setAttribute("replyList", ar);
		
		af.setIscheck(true);
		af.setPath("/galHo/galHoReplyList.jsp");
		return af;
	}

}
