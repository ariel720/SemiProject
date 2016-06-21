<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#myRes_01 {
		width: 1220px;
		height: 1000px;
		margin: 0 auto;
		overflow: hidden;
		background-color: white;
	}
	#myRes_01_01 {
		width: 900px;
		height: 36px;
		margin: 0 auto;
		margin-top: 20px;
	}
	#myRes_01_02 {
		width: 900px;
		height: 25px;
		margin: 10px auto;
		font-size: 15px;
		font-family: sans-serif;
		color: #666666;
		font-weight: bold;
	}
	#ResTableDiv {
		width: 900px;
		height: 300px;
		margin: 0 auto;
		
	}
	#myResTable {
		width: 900px;
		border: 1px solid #e6e6e6;
		border-spacing: 0px;
		border-collapse: collapse;
		font-family: sans-serif;
		font-size: 12px;
		text-align: center;
	}
	#myResTable td {
		height: 25px;
	}
	#myResTableTr_01 td {
		border-top: 2px solid black; 
		border-bottom: 1px solid #e6e6e6;
		background-color: #f2f2f2;
		height: 30px;
	}
	#myRes_01_03 {
		width: 900px;
		height: 25px;
		margin: 10px auto;
		margin-top: 20px;
		font-size: 15px;
		font-family: sans-serif;
		color: #666666;
		font-weight: bold
	}
	#myListTitle {
		width: 900px;
		height: 36px;
		margin: 0 auto;
		margin-top: 20px;
	}
	#myListTable {
		width: 900px;
		border: 1px solid #e6e6e6;
		border-spacing: 0px;
		border-collapse: collapse;
		font-family: sans-serif;
		font-size: 12px;
		text-align: center;
		margin: 0 auto;
	}
	#myListTable td {
		height: 25px;
	}
	#myResTableTr_02 td {
		border-top: 2px solid black; 
		border-bottom: 1px solid #e6e6e6;
		background-color: #f2f2f2;
		height: 30px;
	}
	#myListTableText {
		font-family: sans-serif;
		color: gray;
		text-decoration: none;
	}
	#myListTableText:HOVER {
		color: gray;
		text-decoration: none;
	}
	#myListTableText:ACTIVE {
		color: gray;
		text-decoration: none;
	}
	#myListNext {
		width: 129px;
		margin: 0 auto;
	}
	#myListNext_01 {
		width: 30px;
		height: 20px;
		margin: 10px auto;
		float: left;
	}
	#myListNext_02 {
		width: 69px;
		height: 20px;
		margin: 10px auto;
		float: left;
		text-align: center;
	}
	#myListNext_03 {
		width: 30px;
		height: 20px;
		margin: 10px auto;
		float: left;
	}
	.myListNextClass {
		font-family: sans-serif;
		color: gray;
		text-decoration: none;
	}
	.myListNextClass:HOVER {
		color: gray;
		text-decoration: none;
	}
	.myListNextClass:ACTIVE {
		color: gray;
		text-decoration: none;
	}
	#myRes_01_04 {
		width: 900px;
		height: 25px;
		margin: 10px auto;
		margin-top: 20px;
		font-size: 15px;
		font-family: sans-serif;
		color: #666666;
		font-weight: bold;
		clear: both;
	}
	#hrTextTable {
		width: 900px;
		height: 70px;
		margin: 0 auto;
		border: 1px solid #e6e6e6;
		border-spacing: 0px;
		border-collapse: collapse;
		font-family: sans-serif;
		font-size: 12px;
		color: gray;
	}
	#hrTT_01 {
		width: 180px;
		text-align: center;
		font-weight: bold;
		color: gray;
		background-color: #f2f2f2;
	}
</style>
</head>
<body>
	<%@ include file="../temp/header.jspf" %>
	<c:if test="${member.id eq null}">
	<script type="text/javascript">
		$(function() {
			alert("접근경로가 잘못되었습니다.");
			location.href="<%=application.getContextPath()%>/index.jsp";
		});
		
	</script>
</c:if>
<script type="text/javascript">

$(function(){
	$("#title2m").text("My Page");
	$("#_01m").text("MY INFO");
	$("#_02m").text("MY RES");
	$("#_01m").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_02m").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	$("#_02m").css("color", "white");
	$("#_01m").css("color", "#8877d5");
	$("#_01m").click(function() {
		location.href="<%= application.getContextPath() %>/mem/myInfo.jsp";
		$("#_01m").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$("#_02m").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	});
	$("#_02m").click(function() {
		location.href="<%= application.getContextPath() %>/res/list_m.res?cp=1";
		
	});

});	

</script>
	<%@ include file="../temp/myResHe.jsp" %>
	<div id="myRes_01">
		<div id="myRes_01_01">
			<img src="/semiProject/image/hr/myRes_010.png">
		</div>
		<div id="myRes_01_02">주문상품 정보</div>
		<div id="ResTableDiv">
			<table id="myResTable">
				<tr id="myResTableTr_01">
					<td>예약번호</td><td>예약자</td><td>방타입</td><td>묘수</td><td>연락처</td><td>총 입실시간</td><td>입실시간</td><td>퇴실시간</td><td>가격</td>
				</tr>
				<c:forEach var="i" items="${myRes}" step="1">
					<tr>
						<td>${i.res_num}</td>
						<td>${i.r_name}</td>
						<td>
							<c:choose>
								<c:when test="${i.room_price == 2000}">
									deluxe
								</c:when>
								<c:otherwise>
									suite
								</c:otherwise>
							</c:choose>
						</td>
						<td>${i.cat_counts}</td>
						<td>${i.ph1} - ${i.ph2} - ${i.ph3}</td>
						<td>${i.time_counts}</td>
						<td>${i.start_day}</td>
						<td>${i.last_day}</td>
						<td>${i.total_price}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="myListTitle">
			<img src="/semiProject/image/hr/myRes_01.PNG">
		</div>
		<div id="myRes_01_03">내가 쓴 게시물</div>
		<table id="myListTable">
			<tr id="myResTableTr_02">
				<td>번호</td><td>제목</td><td>작성자</td><td>등록일자</td><td>조회</td>
			</tr>
			<c:forEach var="i" items="${myWriteList}" step="1">
				<tr>
					<td>${i["num"]}</td>
					<td>
						<a href="view.fr?check=0&num=${i['num']}" id="myListTableText">${i["title"] }</a>
					</td>
					<td>${i["id"]}</td>
					<td>${i["reg_date"]}</td>
					<td>${i["counts"]}</td>
				</tr>
			</c:forEach>
		</table>
		<div id="myListNext">
			<div id="myListNext_01">
				<c:if test="${myListV['cblock'] > 1}">
					<a href="list_m.res?cp=${myListV['startp']-1}" class="myListNextClass">[이전]</a>
				</c:if>
			</div>
			<div id="myListNext_02">
				<c:forEach var="t" begin="${myListV['startp']}" end="${myListV['lastp']}" step="1">
					<a href="list_m.res?cp=${t}" class="myListNextClass">${t}</a>
				</c:forEach>
			</div>
			<div id="myListNext_03">
				<c:if test="${myListV['cblock']<myListV['ttBlock']}">
					<a href="list_m.res?cp=${myListV['lastp']+1}" class="myListNextClass">[다음]</a>
				</c:if>
			</div>
		</div>
		<div id="myRes_01_04">최소/환불 안내</div>
		<table id="hrTextTable">
			<tr>
				<td id="hrTT_01">안내</td>
				<td id="hrTT_02">
					퍼플캣에서는 예약/결제 후 부득이한 사정으로 취소할 경우 예약하신 입실시간 전까지 전화로 연락 주시면 100% 결제 취소 및<br>
					환불처리 해 드립니다. 다만 입실시간 이후 취소에 대해서는 묘수, 이용 일수에 상관 없이 \10,000원 의 위약금이 발생하오니<br>
					예약 시 꼭 참고하시기 바랍니다.
				</td>
			</tr>
		</table>
		
	</div>
<%@ include file="../temp/footer.jspf" %>
</body>
</html>