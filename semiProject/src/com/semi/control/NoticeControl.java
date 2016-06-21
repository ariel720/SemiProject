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
import javax.swing.plaf.synth.SynthSeparatorUI;

import com.semi.util.Action;
import com.semi.util.ActionForward;

/**
 * Servlet implementation class NoticeControl
 */
@WebServlet("/NoticeControl")
public class NoticeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeControl() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    private Map<String, Object> map=new HashMap<String, Object>();
  //이 페이지안에서만 쓸 map이므로 앞에 private 붙여줌.
    
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	String file=config.getInitParameter("Ntconfig");//읽어올 properties 파일명
    	String path=config.getServletContext().getRealPath("/WEB-INF");//프로젝트명에서 ("")까지의 경로명
   
    
    FileInputStream fi=null;
    Properties pr=new Properties();//pr안에 있는 load메소드를 사용하기위해
    
    try {
		fi=new FileInputStream(new File(path, file));//파일안에 있는 내용을 한줄한줄 읽어옴
		pr.load(fi);//파일안에 있는 내용을 키와 value로 쪼갬.
		
		
		Iterator<Object> ir=pr.keySet().iterator(); //키의 값을 iterator형태로 바꿔서 ir에 저장
		
		while(ir.hasNext()){
			
			String keys=(String)ir.next();
			String values=pr.getProperty(keys);
			Class valclass = Class.forName(values);
			Object objclass=valclass.newInstance();
		
			
			map.put(keys, objclass);
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
		doPost(request, response);}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String path1=request.getRequestURI();//전체경로명
		String path2=request.getServletContext().getContextPath();
		
		path1=path1.substring(path2.length()+1);
				
		Action a=(Action)map.get(path1);
	ActionForward af=a.doProcess(request, response);
		
			RequestDispatcher rd=request.getRequestDispatcher(af.getPath());
			rd.forward(request, response);
			
	
		
	}

}
