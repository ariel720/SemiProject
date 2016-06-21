<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="<%=application.getContextPath() %>/css/freeview.css" rel="stylesheet">

<title>Insert title here</title>



<script type="text/javascript">


function go1() {
	var n = ${fr.num};
	location.href="delete.fr?num="+n;
}

function go2() {
	var n = ${fr.num};
	location.href="view.fr?check=1&num="+n;
}

function go3(n) {
	
	
	location.href="re_delete.fr?num="+n; 
}

	function go4(n) {
		
				
		var re=document.getElementById(n);
		re.style.display='block'; 		
	}
	


$(function(){
	$("#go").click(function(){
		 $.ajax({
			url:"Reply.fr",
			type: "POST",
			data : {
				id: $("#id").val(),
				contents: $("#contents").val(),
				ref: '${fr.num}'
			},
			success: function(result){
				result=result.trim();
				$("#re_view").append(result);
				location.reload();
				
				
				
			}
		});
	});
	
});

	function go5(da){
		 $.ajax({
			url:"re_update.fr",
			type: "POST",
			data : {
				
				contents: $("#up_contents"+da).val(),
				num : $("#num").val()
			},
			success: function(result){
				var t = "#sss"+da;
				result=result.trim();
				$(t).html(result);
						 				
				 $(".re").css("display", "none");
				  
			} 	
		});
	}





</script>

<style type="text/css">
/* 
.re{
display: none;

}

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
font-size: 16px;
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
margin-top: 10px;
width: 750px;
height: 300px;

}

#ptit{
margin-top: 10px;

}

#pday{
margin-top: 7px;

}

#re_div{

margin-top: 10px;

}


#re_table{

	margin: 0 auto;
    background: #f4f4f4;
    width: 800px;
 	position: relative;
 	
}


#re_view{
padding: 10px;
width: 100%;



}

#re_view th{
text-align: left;
font-size: 22px;


}

#day{
text-align: right;

}

.re_contents td{

    border-bottom: 1px solid;
    border-bottom-style: dashed;
text-align: right;
}

.re_contents p{

   margin-bottom: 10px;
   text-align: left;
   
}

.re_contents input{

float: right;
margin-bottom: 5px;
   
   
}

#refrom{
background-color: #f4f4f4;
position: relative;
margin: 0 auto;
width: 800px;
margin-top: 10px;

}
#refromtable{
padding: 10px;
width: 100%;

}


#refromtable td{

padding: 10px;

}

#contents{
width: 620px;
height: 100%;
}


#go{
height: 58px;
width: 120px;

}

#re_td{
width: 400px;
height: 58px;
}
#re_td2{
height: 30px;

}

#cunbut{

text-align: right;
padding: 10px;
}

.re_contents p{

margin-top: 2px;


}
 */
 p{
 	margin: 0 !important;
 }
</style>

<script type="text/javascript">


</script>



</head>
<body>
<%@ include file="../temp/header.jspf" %>
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
	$.trim($("#counts").text());
});	
</script>
<!-- ==============HEADER================= -->
<%@ include file="../temp/mHeader_02.jsp" %>


<div id="w_change">
<form action="write.nt" method="post" id="frm">
<div id="write" >
<div id="topdiv"><h2 id="h2">자유게시판</h2></div>
<div id="candiv">
<div id="boder">
<div id="tit"><p id="ptit">${fr.title }</p></div><div id="day"><p id="pday">${fr.reg_date }<p></div>
</div>

<div id="id_div"><p id="p_id">작성자 :${fr.id } </p></div>
<div id="counts">${fr.contents }</div>
</div>
<div id="cunbut">
<c:choose>
	<c:when test="${member['id'] ne null }">
		<c:choose>
			<c:when test="${member['id'] eq 'admin' }">
				<input type="button" onclick="go1()" value="삭제">
			</c:when>
			<c:when test="${member['id'] ne fr.id  }">
				<input type="button" onclick="go1()" value="삭제">
				<input type="button" onclick="go2()" value="수정">
			</c:when>
		
		</c:choose>
	
	</c:when>
</c:choose>
<%-- <c:if test="${member.id eq 'admin' }">
<input type="button" onclick="go1()" value="삭제">
<c:if test=" ${member.id eq fr.id }">
<input type="button" onclick="go2()" value="수정">
</c:if>

</c:if> --%>
</div>
<div id="re_div">


<div id="re_table">


<table id="re_view">

<c:forEach var="i" items="${re_al}" step="1" >


<tr><th>${i.id}<p id="day">${i.reg_date}</p></th></tr>
<tr class="re_contents"><td><p id="sss${i.num}">${i.contents}</p>
<div>
	<c:if test="${(member.id eq 'admin') || (member.id eq i.id)}">
		<input type="button" value="삭제" onclick="go3(${i.num})">
		<c:if test="${member.id eq i.id }">
			<input type="button" value="수정" onclick="go4('re${i.num}')">	
		
		</c:if>
	</c:if>

</div></td>


</tr>



<tr id="re${i.num}" class="re"><td>
<input type="hidden" name="num" id="num" value="${i.num}">
<textarea rows="5" cols="85" name="up_contents" id="up_contents${i.num}">${i.contents}</textarea>
<input type="button" value="수정" onclick="go5(${i.num})"><br>

</td></tr> 


</c:forEach>


</table>


</div>

<div id="refrom">

<form action="">
<table id="refromtable">
<tr>
<td colspan="2"><input type="hidden" id="id" name="id" value="${member.id }"> ${member.id } </td>
</tr>
<tr>
<td id="re_td"><textarea id="contents" rows="5" cols="85" name="contents"></textarea></td>
<td id="re_td2"><input type="button" id="go" value="댓글달기"></td>
</tr>


</table>



</form>

</div>



</div>




<div id="button_div">
<!-- 관리자 -->

<!--  -->
<!-- <input class="but" type="button" onclick="" value="목록"> -->
</div>
</div>
</form>
</div>
<%@ include file="../temp/footer.jspf" %>
</body>
</html>