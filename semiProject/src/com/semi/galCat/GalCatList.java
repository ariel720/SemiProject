package com.semi.galCat;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalCatDAO;
import com.semi.dao.GalHoDAO;
import com.semi.dto.GalCatDTO;
import com.semi.dto.GalHoDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalCatList implements Action{
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		int curPage = Integer.parseInt(request.getParameter("curPage"));
		GalCatDAO gdao = new GalCatDAO();

		String sort = null;
		String search =null;
		sort = request.getParameter("sort");
		search = request.getParameter("search");
		ArrayList<GalCatDTO> ar = gdao.galCatList(curPage,sort,search);
		HashMap<String, Integer> hs = gdao.galCatPage(curPage);
		
		request.setAttribute("list", ar);
		request.setAttribute("page", hs);
		ActionForward af = new ActionForward();
		af.setIscheck(true);
		af.setPath("/galCat/galCatList.jsp?curPage="+curPage);
		return af;
	}
}
