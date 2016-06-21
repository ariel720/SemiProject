<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#relist{
margin: 0 auto;
width: 900px;
position: relative;
margin-top: 50px;
}
#relist_t1 {
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


}
thead tr{
	   
	    display: table-row;
	    vertical-align: inherit;
	
}

table {
font-size: 12px;
	    border-collapse: separate;
		border-spacing: 0;
		}
#pag{
text-align: center;
margin-top: 20px;

}

#tabletd td{

font: bold;
font-size: 12px;

}


</style>

<script type="text/javascript">

function view(n) {
	location.href="view.res?check=0&res_num="+n;
}

</script>

</head>
<body>
<%@ include file="../temp/header.jspf" %>
<script type="text/javascript">
	$(function() {
		$("#title1").text("Reservation");
		$("#_01").text("Operation Guide");
		$("#_02").text("Reservation");
		$("#_03").text("PICK UP & DROP");
	})
	$(function() {
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_03").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$("#_01").css("color", "#8877d5");
		$("#_03").css("color", "#8877d5");
		$("#_02").css("color", "white");
		$("#_03").click(function(){
			location.href="<%=application.getContextPath()%>/res/pick.jsp";
		});
		$("#_01").click(function(){
			location.href="<%=application.getContextPath()%>/res/price.jsp";
		});
	});
</script>
<%@ include file="../temp/mHeader_01.jsp" %>

<div id="relist">
<div id="relist1">
<div id="relist_t1">예약정보</div>
<img src="../image/jy/bg_h3.jpg"></div>
<h3 id="h3">주문상품정보</h3>


	<table style="width: 900px">
		<colgroup>
<col width="7%;">
<col width="7%;">
<col width="7%;">
<col width="7%;">
<col width="17%;">
<col width="17%;">
<col width="15%;">
<col width="15%;">
<col width="*">

</colgroup>
		<thead><tr id="trhead" style="background: #f6f6f6;">
			<td>예약번호</td>
			<td>예약자</td>
			<td>방타입</td>
			<td>묘수</td>
			<td>입실</td>
			<td>퇴실</td>
			<td>연락처</td>
			<td>가격</td>
			<td>상세보기</td>
		</tr></thead>
<tbody id="tabletd">
		<c:forEach var="i" items="${resal}" step="1">
			<tr>
				<td>${i.res_num}</td>
			<td>${i.r_name}</td>
			<td>
			<c:if test="${i.room_price==3000}">suite</c:if>
		<c:if test="${i.room_price==2000}">delux</c:if>

			</td>
			
			<td>${i.cat_counts}</td>
			<td>${i.start_day}</td>
			<td>${i.last_day}</td>
			<td>${i.ph1}-${i.ph2}-${i.ph3}</td>
			<td>${i.total_price}</td>
				<td><input type="button" value="상세보기" onclick="view(${i.res_num})"></td>
			
			</tr>

		</c:forEach></tbody>
	</table>


	<c:if test="${reshs['cblock'] > 1}">
	
		<input type="button" value="[이전]" onclick="refresh(${reshs['startp']-1})">
	</c:if>
	<c:forEach var="t" begin="${reshs['startp']}" end="${reshs['lastp']}" step="1">
	
		<input type="button" value="${t}" onclick="refresh(${t})">
	</c:forEach>
	<c:if test="${reshs['cblock']<reshs['ttBlock']}">
	
		<input type="button" value="[다음]" onclick="refresh(${reshs['lastp']+1})">
	</c:if></div>
	<%@ include file="../temp/footer.jspf"%>
</body>
</html>