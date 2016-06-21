package com.semi.mem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MemDAO;
import com.semi.dto.MemDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Login implements Action{
	
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		MemDTO memDTO = new MemDTO();
		MemDAO memDAO = new MemDAO();
		memDTO.setId(request.getParameter("id"));
		memDTO.setPw(request.getParameter("pw"));
		memDTO = memDAO.Login(memDTO);
		if(memDTO != null){
			HttpSession session = request.getSession();
			session.setAttribute("member", memDTO);
			/*request.setAttribute("message", "성공");*/
			
			af.setIscheck(true);
			af.setPath("/index.jsp");
		}else {
			af.setIscheck(false);
			af.setPath("/index.jsp");
			request.setAttribute("message", "* 아이디나 비밀번호가 잘못 입력되었습니다. *");
		}
		return af;
	}
}
