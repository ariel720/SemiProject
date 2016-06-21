package com.semi.galHo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.GalHoDAO;
import com.semi.dto.GalHoDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalHoUpdate implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalHoDTO gdto = new GalHoDTO();
		GalHoDAO gdao = new GalHoDAO();
		HttpSession session = request.getSession();
		gdto.setId(request.getParameter("id"));
		gdto.setTitle(request.getParameter("title"));
		gdto.setContents(request.getParameter("contents"));
		gdto.setImagefile((String)session.getAttribute("imageFile"));
		gdto.setNum(Integer.parseInt(request.getParameter("num")));
		String curPage = request.getParameter("curPage");
		
		
		ActionForward af = new ActionForward();
		int result = gdao.galHoUpdate(gdto);
		if(result>0){
			request.setAttribute("message", "수정 완료");
			af.setIscheck(true);
			af.setPath("/galHo/galHoView.gh?num="+gdto.getNum()+"&curPage="+curPage);
		}else{
			request.setAttribute("message", "수정 오류");
			af.setIscheck(true);
			af.setPath("/galHo/galHoList.gh?curPage="+curPage);
		}
		return af;
	}

}
