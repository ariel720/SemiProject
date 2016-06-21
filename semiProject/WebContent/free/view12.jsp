<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.re{

display: none;
}

</style>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>

<style type="text/css">

#view{



}



#t1{
width: 900px;

border-top: 1px gray solid;
font-size: small;
}

#t1 td{
border-bottom: 1px gray solid;

}


</style>

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
				$("#r").append(result);
				
			}
		});
	});
	
});

	function go5(da){
		 $.ajax({
			url:"re_update.fr",
			type: "POST",
			data : {
				
				contents: $("#up_contents").val(),
				num : $("#num").val()
			},
			success: function(result){
				var t = "#"+da;
				result=result.trim();
				$(t).html(result);
						 
				 $(".re").css("display", "none");
			} 
		});
	}



</script>
</head>
<body>

<div id="view">



<table id="t1">

<tr style="background:#f6f6f6;"><td>${fr.title }<span>${fr.reg_date }</span></td></tr>
<tr><td><span>${fr.id }</span><span>${fr.counts }</span></td></tr>
<tr><td>${fr.contents }</td></tr>


</table>
<input type="button" onclick="go1()" value="delete">
<input type="button" onclick="go2()" value="update">


<!-- =======================댓글 폼 -->

<form action="">
<table>
<tr><td><input type="text" id="id" name="id"></td></tr>  <!--아이디  -->
<tr><td><textarea rows="10" cols="120"  name="contents" id="contents"></textarea></td></tr>
<tr><td><input type="button" id="go" value="save"></td></tr>
</table>
</form>


<!-- =======================댓글 목록-->

<div id="r">
</div>


<c:forEach var="i" items="${re_al}" step="1" >
<table class="t2">

<tr><td><span id="re_num">${i.num}</span><span>${i.id}</span><span>${i.reg_date}</span></td></tr>
<tr><td id="re_contents${i.num}">${i.contents}</td><td>


<input type="button" value="삭제" onclick="go3(${i.num})" >
<input type="button" value="수정" onclick="go4('re${i.num}')"></td></tr>
<tr></tr>



<!-- 수정박스================== -->


<tr id="re${i.num}" class="re"><td>
<input type="hidden" name="num" id="num" value="${i.num}">
<textarea rows="10" cols="75" name="up_contents" id="up_contents">${i.contents}</textarea>
<input type="button" value="수정" onclick="go5('re_contents${i.num}')"><br>

</td></tr> 
</table>
</c:forEach>

</div>

</body>
</html>