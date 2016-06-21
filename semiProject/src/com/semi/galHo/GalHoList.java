package com.semi.galHo;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.GalHoDAO;
import com.semi.dto.GalHoDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalHoList implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		int curPage = Integer.parseInt(request.getParameter("curPage"));
		GalHoDAO gdao = new GalHoDAO();
		
		ArrayList<GalHoDTO> ar = gdao.galhoList(curPage);
		HashMap<String, Integer> hs = gdao.galHoPage(curPage);
		
		request.setAttribute("list", ar);
		request.setAttribute("page", hs);
		ActionForward af = new ActionForward();
		af.setIscheck(true);
		af.setPath("/galHo/galHoList.jsp?curPage="+curPage);
		return af;
	}

}
