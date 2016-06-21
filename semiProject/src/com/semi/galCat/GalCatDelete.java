package com.semi.galCat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalCatDAO;
import com.semi.dao.GalHoDAO;
import com.semi.dto.GalCatDTO;
import com.semi.dto.GalHoDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalCatDelete implements Action{
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		GalCatDTO gdto = new GalCatDTO();
		gdto.setNum(Integer.parseInt(request.getParameter("num")));
		String curPage = request.getParameter("curPage");
		GalCatDAO gdao = new GalCatDAO();
		int result = gdao.galCatDelete(gdto);
		ActionForward af = new ActionForward();
		System.out.println(curPage);
		if(result>0){
			request.setAttribute("message","삭제 완료");
			af.setIscheck(true);
			af.setPath("/galCat/galCatList.gc?curPage="+curPage);
		}else{
			request.setAttribute("message","삭제 실패");
			af.setIscheck(true);
			af.setPath("/galCat/galCatList.gc?curPage="+curPage);
		}
		
		return af;
	}
}
