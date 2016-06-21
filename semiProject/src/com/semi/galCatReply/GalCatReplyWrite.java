package com.semi.galCatReply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalCatReplyDAO;
import com.semi.dao.GalHoReplyDAO;
import com.semi.dto.GalCatReplyDTO;
import com.semi.dto.GalHoReplyDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalCatReplyWrite implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalCatReplyDTO grdto = new GalCatReplyDTO();
		grdto.setContents(request.getParameter("contents"));
		grdto.setId(request.getParameter("id"));
		grdto.setRef(Integer.parseInt(request.getParameter("ref")));
		GalCatReplyDAO grdao = new GalCatReplyDAO();
		grdto = grdao.replyWrite(grdto);
		String curPage = request.getParameter("curPage");
		ActionForward af = new ActionForward();
		if(grdto!=null){
			request.setAttribute("replyCat", grdto);
			af.setIscheck(true);
			af.setPath("/galCat/galCatReplyWriteResult.jsp");
		}else{
			af.setIscheck(true);
			af.setPath("/galCat/galCatView.gc?num="+grdto.getRef()+"&curPage=1");
		}
		
		return af;
	}

}
