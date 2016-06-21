<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- c태그 쓰기 -->
<%@page import="org.json.simple.JSONObject"%> <!-- json 쓰기1 -->
<%@page import="org.json.simple.JSONArray"%><!-- json 쓰기2 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<c:if test="${(member.id eq null) || (member.id ne 'admin')}">
	<script type="text/javascript">
		$(function() {
			alert("접근경로가 잘못되었습니다.");
			location.href="<%=application.getContextPath()%>/index.jsp";
		});
		
	</script>
</c:if>
<script type="text/javascript">
$(function () {
	 $.ajax({
			url:"list.res",
			type: "POST",
			data : {	
				cp : 1
			},
			success: function(result){	
				result=result.trim();
				$("#list_res2").html(result);
			  
			} 	
		});

});

function refresh(n){
	 $.ajax({
			url:"list.res",
			type: "POST",
			data : {	
				cp : n
			},
			success: function(result){	
				result=result.trim();
				$("#list_res2").html(result);
			  
			} 	
		});
}
 
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		
	 	var t = '${al}';
	 	var t2 = '${al2}';
		
		var result = JSON.parse(t);
		var result2 = JSON.parse(t2);
		
	      var f0=result[0].mth;
			var f1=result[1].mth;
			var f2=result[2].mth;
			var f3=result[3].mth;
			var f4=result[4].mth; 
			
			var c0=result[0].cnt;
			var c1=result[1].cnt;
			var c2=result[2].cnt;
			var c3=result[3].cnt;
			var c4=result[4].cnt;
			
			var s0=result[0].sls;
			var s1=result[1].sls;
			var s2=result[2].sls;
			var s3=result[3].sls;
			var s4=result[4].sls; 
	//============================================		
			var cs0=result2[0].cnt;
			var cs1=result2[1].cnt;
			var cs2=result2[2].cnt;
			var cs3=result2[3].cnt;
			var cs4=result2[4].cnt;
			
			var ss0=result2[0].sls;
			var ss1=result2[1].sls;
			var ss2=result2[2].sls;
			var ss3=result2[3].sls;
			var ss4=result2[4].sls;
			
			
		 
		 
		//=======================예약건수=========================================================
		var data1 = google.visualization.arrayToDataTable([
				[ '월', '디럭스', '스위트' ], 	
				
				[f4, c4, cs4 ],
				[ f3, c3, cs3 ], 
				[ f2, c2, cs2 ],
				[ f1, c1, cs1 ], 
				[ f0, c0, cs0 ]  
				
				]);

		
		var options1 = {
			title : '월별 예약건수',
			legend : {
				position : 'bottom'
			}
		};

		var chart1 = new google.visualization.LineChart(document
				.getElementById('chart1'));

		chart1.draw(data1, options1);
//=======================매출=========================================================
		var data2 = google.visualization.arrayToDataTable([
				[ 'month', '디럭스', '스위트' ], 
				[f4, s4, ss4 ],
				[ f3, s3, ss3 ], 
				[ f2, s2, ss2 ],
				[ f1, s1, ss1 ], 
				[ f0, s0, ss0 ] 
				]);

		var options2 = {
			title : '월별 매출',
			legend : {
				position : 'bottom'
			}
		};
		var chart2 = new google.visualization.LineChart(document
				.getElementById('chart2'));
		chart2.draw(data2, options2);
	}

	function view(n) {//상세보기 넘어가기.
		location.href="view.res?check=0&res_num="+n;
	}
 //=================회원검색===================================
 $(function(){
	$("#bt1").click(function(){
		 $.ajax({
			url:"mylist.res",
			type: "POST",
			data : {
				id: $("#id").val(),				
				cp: 1
			},
			success: function(result){
				result=result.trim();
				$("#list_mem").html(result);
						
			}
		});
	});
	
});
	
	
	
</script>
<style type="text/css">
.gs1{
width: 900px;
margin: 0 auto;

}

#chart1, #chart2{
width: 700px;
height: 400px;
border: 1px gray solid;
margin: 0 auto;
 margin-top: 30px;
}
#id{
	line-height: normal !important;
	height: 25px;
}
#bt1{
	line-height: 18px !important;
	width: 50px;
	height: 25px;
}
#list_res2{

margin-bottom: 30px;
margin-top: 30px;
}

.relist1{
position: relative;
}
.relist_t1 {
position: absolute; 
	line-height: 36px;
	left: 10px;
	color: white;
	font-size: 14px;
	float: left;
}

</style>
</head>
<body>
<%@ include file="../temp/header.jspf" %>

<!-- ============================회원검색하기==========================================	 -->
<div class="gs1">
<div class="relist1">
<div class="relist_t1">회원정보</div>
<img src="../image/jy/bg_h3.jpg"></div>
<h3 id="h3">ID로 회원 검색 &nbsp;&nbsp;
<input type="text" id="id">&nbsp;
<input type="button" value="검색" id="bt1"></h3>
<div id="list_mem"></div></div>
<!-- ============================예약리스트==========================================	 -->
<div id="list_res2"></div>	
<!-- ============================그래프==========================================	 -->
	<div class="gs1">
	<div class="relist1">
<div class="relist_t1">예약현황</div>
<img  src="../image/jy/bg_h3.jpg"></div>
<h3 id="h3">예약 추이 & 매출 추이</h3></div>

	<div id="chart1" ></div>
	<div id="chart2" ></div>
	
<%@ include file="../temp/footer.jspf" %>	
</body>
</html>
