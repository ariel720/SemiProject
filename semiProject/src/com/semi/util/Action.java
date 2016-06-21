package com.semi.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {

		public abstract ActionForward doProcess(HttpServletRequest request, HttpServletResponse response);
	
}
