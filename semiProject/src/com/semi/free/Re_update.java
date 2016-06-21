package com.semi.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.FreeDAO;
import com.semi.dao.ReplyDAO;
import com.semi.dto.ReplyDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Re_update implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af=new ActionForward();
		
		int num=Integer.parseInt(request.getParameter("num"));
		String contents=request.getParameter("contents");
		
		ReplyDTO re= new ReplyDTO();
		re.setNum(num);
		re.setContents(contents);
		
		
		ReplyDAO rdao= new ReplyDAO();
		re =rdao.update(re);
		
		if(re != null){
			request.setAttribute("reply", re);
			af.setIscheck(true);
			af.setPath("/free/re_update.jsp");
			
		}else{
			
			String msg="수정실패";
			request.setAttribute("msg", msg);
			af.setIscheck(false);
			af.setPath("/free/result.jsp");
		}
		
		
		return af;
	}

}
