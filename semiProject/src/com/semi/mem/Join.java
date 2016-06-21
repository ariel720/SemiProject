package com.semi.mem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.MemDAO;
import com.semi.dto.MemDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Join implements Action{

	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		MemDTO memDTO = new MemDTO();
		memDTO.setId(request.getParameter("id"));
		memDTO.setPw(request.getParameter("pw"));
		memDTO.setName(request.getParameter("name"));
		memDTO.setEmail_01(request.getParameter("email_01"));
		memDTO.setEmail_02(request.getParameter("email_02"));
		memDTO.setPhone_01(request.getParameter("phone_01"));
		memDTO.setPhone_02(request.getParameter("phone_02"));
		memDTO.setPhone_03(request.getParameter("phone_03"));
		
		MemDAO memDAO = new MemDAO();
		int result = memDAO.joins(memDTO);
		
		if(result > 0){
			request.setAttribute("message", "회원가입 성공");
			af.setPath("/index.jsp");
		}else{
			request.setAttribute("message", "회원가입 실패");
			af.setPath("/index.jsp");
		}
		return af;
	}
	
}
