package com.semi.mem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.MemDAO;
import com.semi.dto.MemDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Update implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		MemDTO memDTO = new MemDTO();
		MemDAO memDAO = new MemDAO();
		
		memDTO.setId(request.getParameter("id"));
		memDTO.setPw(request.getParameter("pwCh"));
		memDTO.setEmail_01(request.getParameter("emailCh_01"));
		memDTO.setEmail_02(request.getParameter("emailCh_02"));
		memDTO.setPhone_01(request.getParameter("phoneCh_01"));
		memDTO.setPhone_02(request.getParameter("phoneCh_02"));
		memDTO.setPhone_03(request.getParameter("phoneCh_03"));
		
		int result = memDAO.update(memDTO);
		
		if(result > 0){
			request.setAttribute("message", "수정완료");
			af.setPath("/===============/updateTest.jsp");
		}else{
			request.setAttribute("message", "수정실패");
			af.setPath("/===============/updateTest.jsp");
		}
		return af;
	}
	
}
