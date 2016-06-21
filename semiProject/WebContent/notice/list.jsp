<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=application.getContextPath() %>/css/noticelist.css" rel="stylesheet">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
/* 
 #board{
width: 900px;
margin: 0 auto;

}
#bodartable{

border-top: 1px solid;
width: 100%;
text-align: center;
border-collapse: collapse;
height: 35px;

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
font-size: 14px;
}

.tabletitle{
text-align:left;

}

#pg{
text-align: center;
margin-top: 20px;

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

span {
	margin-top: 10px;
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

<script type="text/javascript">
$(function () {
	$("#_01").text("Notice");
});

$(function () {
	$("#_02").text("Free Board");
});

$(function () {
	$("#title").html('<img src="<%=application.getContextPath()%>/image/sh/board_title.jpg">');
});

</script>



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

<!-- header -->
<%@ include file="../temp/header.jspf" %>

<script type="text/javascript">

$(function(){
	$("#title2").text("Board");
	$("#_01").text("Notice Board");
	$("#_02").text("Free Board");
	$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_01").css("color", "white");
	$("#_02").css("color", "#8877d5");
	$("#_01").click(function() {
		location.href="<%=application.getContextPath()%>/notice/list.nt?cp=1";
		
	});
	$("#_02").click(function() {
		location.href="<%=application.getContextPath()%>/free/list.fr?cp=1";
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	});

});	

</script>
<!-- ==============HEADER================= -->
<%@ include file="../temp/mHeader_02.jsp" %>


<div id="board">
<div id="l_change">
<h1>공지사항</h1>

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
<c:forEach var="i" items="${ntal}" step="1">
<tr><td>${i.num}</td><td class="tabletitle"><a href="view.nt?check=0&num=${i.num}">${i.title}</a></td><td>${i.id}</td><td>${i.reg_date}</td><td>${i.counts}</td></tr>
</c:forEach>
</tbody>
</table>


<div id="btn_wr">
<c:if test="${(member.id ne null) && (member.id eq 'admin') }">
<button id="btn_wrt" > 글쓰기</button>
</c:if>
</div>
	<div id="pg">
<c:if test="${nths['cblock'] > 1}">
		<a href="list.nt?cp=${nths['startp']-1}"> [이전]</a>
	</c:if>
	<c:forEach var="t" begin="${nths['startp']}" end="${nths['lastp']}" step="1">
			<a href="list.nt?cp=${t}">${t}</a>
	</c:forEach>
	<c:if test="${nths['cblock']<nths['ttBlock']}">
			<a href="list.nt?cp=${nths['lastp']+1}">[다음]</a>
	</c:if>
</div>
</div>

</div>
<!-- footer -->
<%@ include file="../temp/footer.jspf" %>
</body>
</html>