package com.semi.res;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.semi.dao.MemDAO;
import com.semi.dao.ResDAO;
import com.semi.dto.GraphdataDTO;
import com.semi.dto.MemDTO;
import com.semi.dto.ResDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;

public class Graph implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = new ActionForward();
		JSONArray al=new JSONArray();
		JSONArray al2=new JSONArray();
		
		Calendar now = Calendar.getInstance();		
		
		for(int i=0;i<5;i++){
			
			String month=String.valueOf(now.get(Calendar.MONTH)+1-i);
			int year=now.get(Calendar.YEAR);
			
			if(now.get(Calendar.MONTH)+1<10){
				month="0"+month+"";
			}
			
			if(now.get(Calendar.MONTH)+1-i==0){
				month="12";
				year=year-1;
			}else if(now.get(Calendar.MONTH)+1-i==-1){
				month="11";
				year=year-1;
			}else if(now.get(Calendar.MONTH)+1-i==-2){
				month="10";
				year=year-1;
			}else if(now.get(Calendar.MONTH)+1-i==-3){
				month="8";
				year=year-1;
			}
			String y=String.valueOf(year);
			
		
			month=y+"-"+month;
			
		
			
			
			ResDAO rdao=new ResDAO();			
			GraphdataDTO gd= rdao.month_res(month, 3000);
			GraphdataDTO gd2= rdao.month_res(month, 2000);
			
			JSONObject datas=new JSONObject();
			JSONObject datas2=new JSONObject();
		
		
			datas.put("mth", gd.getMonth());
			datas.put("cnt", gd.getRes_counts());
			datas.put("sls", gd.getSales());
			
			datas2.put("mth", gd2.getMonth());
			datas2.put("cnt", gd2.getRes_counts());
			datas2.put("sls", gd2.getSales());

			al.add(datas);
			al2.add(datas2);
			
			
		}
		request.setAttribute("al", al.toJSONString());
		request.setAttribute("al2", al2.toJSONString());

		/*========================================================================*/
		
		
		
		
		
	
	
		af.setIscheck(true);
		af.setPath("/res/graph.jsp");
		
		
		return af;
	}
	
		
}
