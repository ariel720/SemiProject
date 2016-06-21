package com.semi.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.NoticeDAO;
import com.semi.dto.NoticeDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Update implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();

		NoticeDTO nt = new NoticeDTO();
		
		nt.setContents(request.getParameter("smarteditor"));
		nt.setTitle(request.getParameter("title"));
		nt.setCounts(Integer.parseInt(request.getParameter("counts")));
		nt.setNum(Integer.parseInt(request.getParameter("num")));

		
		
		NoticeDAO ndao = new NoticeDAO();
		int result = ndao.update(nt);
		String msg = null;

		if (result > 0) {

			af.setIscheck(true);
			af.setPath("/notice/result.jsp");

			msg = "업데이트 성공";
			request.setAttribute("msg", msg);

		} else {
			af.setIscheck(false);
			af.setPath("/notice/result.jsp");

			msg = "업데이트 실패";
			request.setAttribute("msg", msg);

		}

		return af;
	}

}
