package com.semi.galCat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.GalCatDAO;
import com.semi.dao.GalHoDAO;
import com.semi.dto.GalCatDTO;
import com.semi.dto.GalHoDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalCatWrite implements Action{
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalCatDTO gdto = new GalCatDTO();
		HttpSession session = request.getSession();
		gdto.setId(request.getParameter("id"));
		gdto.setTitle(request.getParameter("title"));
		gdto.setContents(request.getParameter("contents"));
		gdto.setImagefile((String)session.getAttribute("imageFile"));
		GalCatDAO gado = new GalCatDAO();
		int result = gado.writeGal(gdto);
		
		ActionForward af = new ActionForward();
		if(result>0){
			request.setAttribute("message", "글쓰기 성공");
			af.setIscheck(true);
			af.setPath("/galCat/galCatList.gc?curPage=1");
		}else{
			request.setAttribute("message", "글쓰기 실패");
			af.setIscheck(true);
			af.setPath("/galCat/galCatList.gc?curPage=1");
		}
		
		return af;
	}
}
