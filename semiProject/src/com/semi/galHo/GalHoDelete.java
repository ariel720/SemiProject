package com.semi.galHo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalHoDAO;
import com.semi.dto.GalHoDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalHoDelete implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalHoDTO gdto = new GalHoDTO();
		gdto.setNum(Integer.parseInt(request.getParameter("num")));
		String curPage = request.getParameter("curPage");
		GalHoDAO gdao = new GalHoDAO();
		int result = gdao.galHoDelete(gdto);
		ActionForward af = new ActionForward();
		System.out.println(curPage);
		if(result>0){
			request.setAttribute("message","삭제 완료");
			af.setIscheck(true);
			af.setPath("/galHo/galHoList.gh?curPage="+curPage);
		}else{
			request.setAttribute("message","삭제 실패");
			af.setIscheck(true);
			af.setPath("/galHo/galHoList.gh?curPage="+curPage);
		}
		
		return af;
	}

}
