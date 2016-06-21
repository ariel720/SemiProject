<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="update.res" method="post">
<table>

<tr><td>아이디</td><td><input type="text" value="${res.id}" name="id"></td></tr>
<tr><td>예약번호</td><td><input type="text" value="${res.res_num}" name="res_num"></td></tr>
<tr><td>예약자</td><td><input type="text" value="${res.r_name}" name="r_name"></td></tr>
<tr><td>방 타입</td><td><input type="text" value="${res.room_price}" name="room_price"></td></tr>
<tr><td>묘수</td><td><input type="text" value="${res.cat_counts}" name="cat_counts"></td></tr>
<tr><td>연락처</td><td><input type="text" value="${res.ph1}" name="ph1">-<input type="text" value="${res.ph2}" name="ph2">-<input type="text" value="${res.ph3}" name="ph3"></td></tr>
<tr><td>입실 시간</td><td><input type="text" value="${res.start_day}" name="start_day"></td></tr>
<tr><td>퇴실시간</td><td><input type="text" value="${res.last_day}" name="last_day"></td></tr>



<tr><td>총 입실 기간</td><td><input type="text" value="${i.time_counts}" name="time_counts"></td></tr>
<tr><td>가격</td><td><input type="text" value="${i.total_price}" name="total_price"></td></tr>
</table>

<input type="reset" value="초기화">
<input type="button" value="예약 수정">
</form>
</body>
</html>