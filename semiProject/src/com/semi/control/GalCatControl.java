package com.semi.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.util.Action;
import com.semi.util.ActionForward;

/**
 * Servlet implementation class GalCat
 */
@WebServlet("/GalCat")
public class GalCatControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalCatControl() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private Map<String, Object> command = new HashMap<>();
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	String fileName = config.getInitParameter("GcConfig");
    	String realPath = config.getServletContext().getRealPath("/WEB-INF");
  
    	
    	Properties pr = new Properties();
    	FileInputStream fi = null;
    	
    	try {
			
    		fi = new FileInputStream(new File(realPath, fileName));
    		pr.load(fi);
    		Iterator<Object> ir = pr.keySet().iterator();
    		while(ir.hasNext()){
    			String key = (String)ir.next();
    			String value = pr.getProperty(key);
    			Class className = Class.forName(value);
    			Object obj = className.newInstance();
    			
    			command.put(key, obj);
    		}
    	
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fi.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String commands = request.getRequestURI();
		String rootPath = request.getServletContext().getContextPath();
		commands = commands.substring(rootPath.length());
		
		Action a = (Action)command.get(commands);
		ActionForward af = a.doProcess(request, response);
		
		if(af.isIscheck()){
			RequestDispatcher view = request.getRequestDispatcher(af.getPath());
			view.forward(request, response);
		}else{
			response.sendRedirect(af.getPath());
		}
		
	}

}
