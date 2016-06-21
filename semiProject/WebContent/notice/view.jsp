<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=application.getContextPath() %>/css/noticeview.css" rel="stylesheet">


<style type="text/css">
/* 
#button_div{
text-align: right;
margin-top: 20px;

}

.but{

    background-color: #2daebf;
    font-size: 13px;
    padding: 8px 14px 9px;
  	cursor: pointer;
    font-weight: bold;
    -webkit-border-radius: 4px;
    color: #fff;
	border-color: #2daebf;

}

#write{
width: 800px;
margin: 0 auto;
}
#candiv{
position: relative;

    border: 1px solid gray;
margin-top: 10px;
height: 400px;

}

#h2{
margin-left: 25px;

}

#day{
float: right;
margin-top: 15px;
font-size: 13px;
text-align: justify;
}

#tit{
float: left;
font-size: 20px;
font-weight: bold;
height: 10px;
margin-bottom: 15px;

}

#boder{
margin: 0 auto;
border-bottom: 1px solid;
    border-bottom-style: dashed;
line-height: normal;
height: 50px;
width: 750px;


}

#id_div{
margin: 0 auto;
width: 750px;
height: 20px;

}

#p_id{


font-size: 14px;
margin-top: 1px;
float: left;

}

#counts{


margin: 0 auto;
margin-top: 20px;
width: 750px;
height: 300px;

}

#ptit{
margin-top: 10px;

}

#pday{
margin-top: 7px;

}


#w_change{

margin-bottom: 100px;
} */
#ptit{
	max-width: 750px;
}
</style>

<script type="text/javascript">


function go1() {
var n = ${nt.num};
location.href="delete.nt?num="+n;
}

function go2() {
	var n = ${nt.num};
	location.href="view.nt?check=1&num="+n;
}

function go3() {

	location.href="list.nt?cp=1";
}

</script>



</head>
<body>

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


<div id="w_change">
<form action="write.nt" method="post" id="frm">
<div id="write" >
<div id="topdiv"><h2 id="h2">게시판</h2></div>
<div id="candiv">
<div id="boder">
<div id="tit"><p id="ptit">${nt.title}</p></div><div id="day"><p id="pday">${nt.reg_date }<p></div>
</div>

<div id="id_div"><p id="p_id">작성자 :${nt.id } </p></div>
<div id="counts">${nt.contents}</div>
</div>



<div id="button_div">
<!-- 관리자 -->
<c:choose>
	<c:when test="${(member['id'] eq 'admin') &&  (member['id'] ne null) }">
		<input class="but" type="button" onclick="go1()" value="삭제" />
		<input class="but" type="button" onclick="go2()" value="수정">
	</c:when>
</c:choose>
<!--  -->
<input class="but" type="button" onclick="go3()" value="목록">
</div>
</div>
</form> 
</div>
<%@ include file="../temp/footer.jspf"%>
</body>
</html>