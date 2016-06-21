package com.semi.galHo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.GalHoDAO;
import com.semi.dto.GalHoDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalHoWrite implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalHoDTO gdto = new GalHoDTO();
		HttpSession session = request.getSession();
		gdto.setId(request.getParameter("id"));
		gdto.setTitle(request.getParameter("title"));
		gdto.setContents(request.getParameter("contents"));
		gdto.setImagefile((String)session.getAttribute("imageFile"));
		GalHoDAO gado = new GalHoDAO();
		int result = gado.writeGal(gdto);
		
		ActionForward af = new ActionForward();
		if(result>0){
			request.setAttribute("message", "글쓰기 성공");
			af.setIscheck(true);
			af.setPath("/galHo/galHoList.gh?curPage=1");
		}else{
			request.setAttribute("message", "글쓰기 실패");
			af.setIscheck(true);
			af.setPath("/galHo/galHoList.gh?curPage=1");
		}
		
		return af;
	}

}
