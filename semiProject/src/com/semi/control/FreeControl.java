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

import org.apache.catalina.filters.SetCharacterEncodingFilter;

import com.semi.util.Action;
import com.semi.util.ActionForward;

/**
 * Servlet implementation class freeControl
 */
@WebServlet("/freeControl")
public class FreeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeControl() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    private Map<String, Object> map=new HashMap<>();
    
   @Override
public void init(ServletConfig config) throws ServletException {
	// TODO Auto-generated method stub
	super.init(config);
	
	//web.xml에서 어떤 이름을 보고 여기로 왔는지        ↓
	String file=config.getInitParameter("Frconfig"); 
String path=config.getServletContext().getRealPath("/WEB-INF");// 앞에"/" 표시 꼭 붙이기. 	
	
FileInputStream fi=null;
Properties pr=new Properties();


try {
	
	fi=new FileInputStream(new File(path, file));//파일안에 있는 내용을 한줄한줄 읽음.
	pr.load(fi);//파일안의 내용을 "="을 기준으로 쪼갬.
	
	Iterator<Object> ir=pr.keySet().iterator();//쪼갠 값중 key들만 iterator 형태로 바꿔서 iterator에 저장.
	
	while( ir.hasNext()){
		
		String keys=(String)ir.next();
		String values=pr.getProperty(keys);
		Class valclass=Class.forName(values);
		Object objval=valclass.newInstance();
		
		map.put(keys, objval);
	}
	
	
	
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

	
}
    
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String path1=request.getRequestURI();
		String path2=request.getServletContext().getContextPath();
		
		path1=path1.substring(path2.length()+1);
				
		Action a=(Action)map.get(path1);
		
		ActionForward af= a.doProcess(request, response);
		
		RequestDispatcher rd= request.getRequestDispatcher(af.getPath());
		rd.forward(request, response);
		
	}

}
