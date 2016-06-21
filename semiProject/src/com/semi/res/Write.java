package com.semi.res;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.ResDAO;
import com.semi.dto.ResDTO;
import com.semi.util.Action;
import com.semi.util.ActionForward;
import com.sun.org.apache.xerces.internal.impl.dv.DatatypeValidator;

public class Write implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		
		ActionForward af = new ActionForward();

		// int res_num - sql에서 넘겨줌.
		String id = request.getParameter("id");
		String r_name = request.getParameter("r_name");

		int room_price = Integer.parseInt(request.getParameter("room"));
		int cat_counts = Integer.parseInt(request.getParameter("catnum"));
		String ph1 = request.getParameter("ph1");
		String ph2 = request.getParameter("ph2");
		String ph3 = request.getParameter("ph3");

		// 시간+날짜============================================
		String startday = request.getParameter("start_day");
		String lastday = request.getParameter("last_day");

		String starttime = request.getParameter("start_time");
		String endtime = request.getParameter("end_time");

		Timestamp start_day = Timestamp.valueOf(startday + " " + starttime + ".0");
		Timestamp last_day = Timestamp.valueOf(lastday + " " + endtime + ".0");

		// =====시간 카운트 하기

		long start = start_day.getTime();
		long last = last_day.getTime();

		int time_counts = (int) ((last - start) / (1000 * 60 * 60));

		// res_days 저장하기=====================================

		String res_days = startday;

		if (startday.equals(lastday)) {

		} else {

			if (time_counts / 24 > 0) {

				int plus = time_counts / 24;

				Date s = Date.valueOf(startday);

				for(int i=1;i<plus+1;i++){
					
					Calendar ca = Calendar.getInstance(); // 현재날짜의 달력 객체 생성
					ca.setTime(s); // 얘를 date클래스 타입으로 바꿔줌.
					ca.add(Calendar.DATE, i);// 날짜를 plus(숫자)만큼 더해줌.
					
					SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
					res_days = res_days +form.format(ca.getTime()); // <!--↑ ca는 바로 호출할수 없기때문에 포멧을 만들어 그형태를 맞춰서 꺼내줌. -->						
				}
				
			} else {
				res_days = res_days +","+ lastday;
			}

		}

		
		//가격 합계
		int total_price = time_counts * cat_counts * room_price;

		ResDTO res = new ResDTO();
		ResDAO rdao = new ResDAO();

		res.setCat_counts(cat_counts);
		res.setId(id);
		res.setLast_day(last_day);
		res.setPh1(ph1);
		res.setPh2(ph2);
		res.setPh3(ph3);
		res.setR_name(r_name);
		res.setRoom_price(room_price);
		res.setStart_day(start_day);
		res.setTime_counts(time_counts);
		res.setTotal_price(total_price);
		res.setRes_days(res_days);

		
		
		String msg = null;

		int cats=rdao.resOk(startday,room_price);
		int result = 0;
		
		
		if((room_price==3000&&cats<3)||(room_price==2000&&cats<12)){
			
			result = rdao.setRes(res);
			
			
			if (result > 0) {
				af.setIscheck(true);
				af.setPath("/res/result.jsp?check=1");
				
				msg = "예약 성공";
				request.setAttribute("msg", msg);
				
			} else {
				af.setIscheck(false);
				af.setPath("/res/result.jsp");
				
				msg = "얘약 실패";
				request.setAttribute("msg", msg);
			}
		
		}else{
			
			af.setIscheck(false);
			af.setPath("/res/result.jsp");
			
			msg = "해당날짜의 예약이 찼습니다.";
			request.setAttribute("msg", msg);
		}
		
	
		return af;
	}

}
