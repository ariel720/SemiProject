package com.semi.res;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.ResDAO;
import com.semi.dto.ResDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;
import com.sun.media.sound.RealTimeSequencerProvider;

public class Update implements Action{

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
			
			ActionForward af =new ActionForward();
			
			

			ResDTO res=new ResDTO();
			ResDAO rdao= new ResDAO();
		
			
			
			
			
			
			
			
			
			
		return af;
	}

}
