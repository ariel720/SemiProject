<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=application.getContextPath() %>/css/freelist.css" rel="stylesheet">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>

<style type="text/css">

 /* #board{
width: 900px;
margin: 0 auto;

}
#bodartable{

border-top: 1px solid;
width: 100%;
text-align: center;
border-collapse: collapse;

	
}

#bodartable td{


height: 35px;

}


#boardtable2{
width: 100%;
border-top: 1px solid;
width: 100%;
text-align: center;
border-top-color: gray;
border-collapse: collapse;
}

#boardtable2 td{

border-top: 1px solid;
height: 35px;
text-align: center;
border-top-color: gray;

}

.tabletitle{
text-align:left;

}
#pg{
text-align: center;
margin-top: 20px;
font-size: 15px;
}

#btn_wr{
text-align: right;
margin-top: 15px;
}
#btn_wrt{
    background-color: gray;
    color: white;
    font-weight: bolder;
    border-radius: 7px;
    width: 80px;
    height: 30px;
}
 */

.tabletitle{
		max-width: 550px;
		min-width: 5px;
		white-space :nowrap;
		overflow : hidden;
		text-overflow:ellipsis;
	}
</style>
</head>
<body>
<!-- header -->
<%@ include file="../temp/header.jspf" %>

<div id="l_change">

</div>

<script type="text/javascript">

$(function(){
	$("#btn_wrt").click(function(){
		$.ajax({ url:"./write.jsp",  type:"POST",  data: {data:$("#w_change").html()}  ,
			success: function(result){$("#change").html(result);} });	
	});	
});	

</script>

<script type="text/javascript">

$(function(){
	$("#title2").text("Board");
	$("#_01").text("Notice Board");
	$("#_02").text("Free Board");
	$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	$("#_02").css("color", "white");
	$("#_01").css("color", "#8877d5");
	$("#_01").click(function() {
		location.href="<%=application.getContextPath()%>/notice/list.nt?cp=1";
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	});
	$("#_02").click(function() {
		location.href="<%=application.getContextPath()%>/free/list.fr?cp=1";
		
	});

});	

</script>
<!-- ==============HEADER================= -->
<%@ include file="../temp/mHeader_02.jsp" %>




<script type="text/javascript"> //버튼 작동

$(function(){
	$("#_01").click(function(){
				
		$.ajax({ url:"<%=application.getContextPath()%>/notice/list.nt",  type:"POST",
			data: {cp:1} ,
			success: function(result){			
				$("#change").html(result);}
		});	
	});	
	
	$("#btn_wrt").click(function(){
		location.href="./write.jsp"		
	});	

});	

	





 
</script>


<div id="board">
<div id="l_change">
<h1>자유게시판</h1>
<span><img src="<%=application.getContextPath()%>/image/sh/tticon.JPG"></span>
 


<table id="bodartable">
<colgroup>
             <col width="50" >
             <col >
             <col width="110" >
             <col width="100" >
             <col width="70" >
         </colgroup>
<thead>
<tr style="background:#f6f6f6;"><td>번호</td><td>제목</td><td>작성자</td><td>등록일자</td><td>조회</td></tr>
</thead>

<tbody id="boardtable2">
<c:forEach var="i" items="${fral}" step="1">

<tr><td>${i["num"]}</td><td class="tabletitle"><a href="view.fr?check=0&num=${i['num']}">${i["title"] }</a></td><td>${i["id"]}</td><td>${i["reg_date"]}</td><td>${i["counts"]}</td></tr>

</c:forEach>
</tbody>
</table>
 <div id="btn_wr">
 <c:if test="${member.id ne null }">
 <button id="btn_wrt"> 글쓰기</button>
 
 </c:if>
 
 </div>

<div id="pg">
<c:if test="${frhs['cblock'] > 1}">
		<a href="list.fr?cp=${frhs['startp']-1}"> [이전]</a>
	</c:if>
	<c:forEach var="t" begin="${frhs['startp']}" end="${frhs['lastp']}" step="1">
			<a href="list.fr?cp=${t}">${t}</a>
	</c:forEach>
	<c:if test="${frhs['cblock']<frhs['ttBlock']}">
			<a href="list.fr?cp=${frhs['lastp']+1}">[다음]</a>
	</c:if>
</div>
</div>

</div>
<!-- footer -->
	<%@ include file="../temp/footer.jspf" %>
</body>
</html>