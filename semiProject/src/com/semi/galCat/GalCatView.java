package com.semi.galCat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalCatDAO;
import com.semi.dao.GalHoDAO;
import com.semi.dto.GalCatDTO;
import com.semi.dto.GalHoDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalCatView implements Action{
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalCatDAO gdao = new GalCatDAO();
		GalCatDTO gdto = new GalCatDTO();
		gdto.setNum(Integer.parseInt(request.getParameter("num")));
		gdto = gdao.galCatview(gdto);
		int recount = gdao.replyCount(gdto.getNum());
		String curPage = request.getParameter("curPage");
		String check = null;
		check=request.getParameter("check");
		ActionForward af = new ActionForward();
		if(gdto!=null){
			request.setAttribute("replyCounts", recount);
			request.setAttribute("galCatView", gdto);
			if(check!=null){
				af.setIscheck(true);
				af.setPath("/galCat/galCatUpdate.jsp?curPage="+curPage);	
			}else{
				af.setIscheck(true);
				af.setPath("/galCat/galCatView.jsp?curPage="+curPage);				
				
			}
		}else{
			af.setIscheck(true);
			af.setPath("/galCat/galCatList.gc?curPage=1");
		}
		return af;
	}
}
