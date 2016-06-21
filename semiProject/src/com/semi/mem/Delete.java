package com.semi.mem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MemDAO;
import com.semi.dto.MemDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Delete implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		MemDTO memDTO = new MemDTO();
		MemDAO memDAO = new MemDAO();
		
		memDTO.setId(request.getParameter("id"));
		
		int result = memDAO.delete(memDTO);
		HttpSession session = request.getSession();
		if(result > 0){
			request.setAttribute("message", "회원탈퇴 성공");
			session.invalidate();
			af.setIscheck(true);
			af.setPath("/index.jsp");
		}else{
			request.setAttribute("message", "회원탈퇴 실패");
			af.setIscheck(true);
			af.setPath("/index.jsp");
		}
		return af;
	}
	
}
