package com.semi.galHo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalHoDAO;
import com.semi.dto.GalHoDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalHoView implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalHoDAO gdao = new GalHoDAO();
		GalHoDTO gdto = new GalHoDTO();
		gdto.setNum(Integer.parseInt(request.getParameter("num")));
		gdto = gdao.galHoview(gdto);
		int recount = gdao.replyCount(gdto.getNum());
		String curPage = request.getParameter("curPage");
		String check = null;
		check=request.getParameter("check");
		ActionForward af = new ActionForward();
		if(gdto!=null){
			request.setAttribute("replyCount", recount);
			request.setAttribute("galHoView", gdto);
			if(check!=null){
				af.setIscheck(true);
				af.setPath("/galHo/galHoUpdate.jsp?curPage="+curPage);	
			}else{
				af.setIscheck(true);
				af.setPath("/galHo/galHoView.jsp?curPage="+curPage);				
				
			}
		}else{
			af.setIscheck(true);
			af.setPath("/galHo/galHoList.gh?curPage=1");
		}
		return af;
	}

}
