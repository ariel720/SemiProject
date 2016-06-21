package com.semi.galHoReply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalHoReplyDAO;
import com.semi.dto.GalHoReplyDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalHoReplyWrite implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalHoReplyDTO grdto = new GalHoReplyDTO();
		grdto.setContents(request.getParameter("contents"));
		grdto.setId(request.getParameter("id"));
		grdto.setRef(Integer.parseInt(request.getParameter("ref")));
		GalHoReplyDAO grdao = new GalHoReplyDAO();
		grdto = grdao.replyWrite(grdto);
		String curPage = request.getParameter("curPage");
		ActionForward af = new ActionForward();
		if(grdto!=null){
			request.setAttribute("replyHo", grdto);
			af.setIscheck(true);
			af.setPath("/galHo/galHoReplyWriteResult.jsp");
		}else{
			af.setIscheck(true);
			af.setPath("/galHo/galHoView.gh?num="+grdto.getRef()+"&curPage=1");
		}
		
		return af;
	}

}
