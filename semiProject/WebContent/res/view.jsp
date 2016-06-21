<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
#e{
margin: 0 auto;
width: 900px;
position: relative;
}
#e_t1 {
	position: absolute;
	line-height: 36px;
	left: 10px;
	color: white;
	font-size: 14px;
}

#h3{
    margin-top: 20px;
    height: 30px;
    padding-bottom: 5px;
    font: bold 14px/30px '나눔고딕','맑은 고딕',serif;
    color: #444444;
    border-bottom: 1px solid #e9e9e9


}

th{
font-size: 12px;
background: #fafafa;
border-top: 2px solid #242424;
border-bottom: #e5e5e5 1px solid;
text-align: center;
padding: 10px 0 10px 0;

}
td{

  border-bottom: 1px solid #e5e5e5;
    text-align: center;
    padding: 10px 0;
font-size: 12px;

}
thead tr{
	   
	    display: table-row;
	    vertical-align: inherit;	
}

table {
	
	    border-collapse: separate;
		border-spacing: 0;
		}
		
</style>


<script type="text/javascript">

function go1(n) {
	
	if(confirm("정말 취소하시겠습니까? 삭제된 예약내역은 복구되지 않습니다.")){
	location.href="delete.res?res_num="+n; 
		
	}else{
		alert("예약을 취소하지 않았습니다.");
	}

}

function back() {
	history.back(-1);
}

</script>

</head>
<body>

<%@ include file="../temp/header.jspf" %>


<div id="e">
<div id="e1"><div id="e_t1">예약정보</div>
<img src="../image/jy/bg_h3.jpg"></div>
<h3 id="h3">주문상품정보</h3>

<table width="100%" >
<colgroup>
<col width="6%;">
<col width="6%;">
<col width="6%;">
<col width="7%;">
<col width="6%;">
<col width="16%;">
<col width="16%;">
<col width="16%;">
<col width="*">
<col width="6%;">
</colgroup>
<thead>
<tr><th>아이디</th><th>예약번호</th><th>예약자</th><th>방타입</th><th>묘수</th><th>연락처</th><th>총 입실기간</th><th>입실시간</th><th>퇴실시간</th><th>가격</th>
</tr>
</thead>
<tbody>
<tr>
<td>${res.id}</td>
<td>${res.res_num}</td>
<td>${res.r_name}</td>
<td>${res.room_price}</td>
<td>${res.cat_counts}</td>
<td>${res.ph1}-${res.ph2}-${res.ph3}</td>
<td>${res.time_counts}시간</td>
<td>${res.start_day}</td>
<td>${res.last_day}</td>
<td>${res.total_price}</td>
</tr>

</tbody>


</table>
<input type="button" value="예약삭제" onclick="go1(${res.res_num})">
<input type="button" value="목록보기" onclick="back()">
</div>

<%@ include file="../temp/footer.jspf"%>
</body>
</html>