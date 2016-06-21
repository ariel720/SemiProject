<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
			$.ajax({url:"galHoReplyList.ghre",
				type : "POST",
				data : {
						num: "${requestScope.galHoView['num']}"
				},
				success: function(result) {
					result = result.trim();
					$("#galHoReplyList").html(result);
				}
			}); 
		
	});
	$(function() {
		$("#title2").text("Gallery");
		$("#_01").text("Hotel");
		$("#_02").text("Cats");
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_01").css("color", "white");
		$("#_02").css("color", "#8877d5");
		$("#_01").click(function() {
			location.href="<%=application.getContextPath()%>/galHo/galHoList.gh?curPage=1"
			
		});
		$("#_02").click(function() {
			location.href="<%=application.getContextPath()%>/galCat/galCatList.gc?curPage=1"
			$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
			$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		});
	});
	
</script>
<style type="text/css">
	#galHo_vbody_h1{
		border-spacing: 0px;
		border-collapse: collapse;
		
	}
	#galHo_vbody_h1 td{
		border-top: 1px solid gray;
		height: 30px;
		
	}
	input[type=text]{
		border: none;
		width: 100%;
		height: 40px;
	}
	#galHo_vbody, #galHo_vbody_h1{
		width: 1050px;
		margin: 0 auto;
	}
	#galHo_vbody{
		overflow:hidden;
		margin-top: 15px;
	}
	#vwriter{
		float: left;
	}
	#vdate, #vcounts,#vreply{
		float: right;
		margin-left: 10px;
	}
	.w span{
		font-size: small;
		font-weight: lighter;
	}
	#replyLine{
		border: 3px solid gray;
	}
	#replycont{
		margin-bottom: 10px;
	}
	#replybtn{
		text-align: right;
	}
	.UpdateReply{
		display: none;
	}
	#galHo_btn1 input[type=button]{
		background-color: gray;
		color: white;
		font-weight:bolder;
		border-radius:7px;
		width: 80px;
		height: 30px;
	}
	#replybtn input[type="button"]{
		margin-bottom: 10px;
		background-color: white;
		color: gray;
		font-weight:bolder;
		border-radius:7px;
		width: 80px;
		height: 25px;
	}
	#galHo_btn1{
		text-align: right;
	}
	#replybtn{
	height: 30px;
	width: 100%;
	padding-bottom: 10px;
	}
	#galHoReplyList input[type="button"]{
		margin-bottom: 10px;
		background-color: white;
		color: gray;
		font-weight:bolder;
		border-radius:7px;
		width: 40px;
		height: 25px;
	}
	#cot img{
		max-width: 600px;
	}
	#replycont_all{
		background-color:#dcdcdc;
	}
	#replycont{
		padding-top : 10px;
		overflow:hidden;
		text-align: center;
	}
	#galHo_vbody{
		margin-top: 50px;
	}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="../temp/header.jspf" %>
	<!-- section -->
	<%@ include file="../temp/mHeader_02.jsp" %>
	<div id="galHo_vbody">
	
		<div id="galHo_vbody_h">
			<table id="galHo_vbody_h1">
				<tr>
					<td class="w" colspan="4"><img src="../image/jw/galHoImg/doc.jpg">&nbsp;&nbsp;&nbsp; ${requestScope.galHoView['title'] } </td> 
					<td>
						<input type="hidden" name="num" id="num" value="${requestScope.galHoView['num'] }">
					</td>
				</tr>
				<tr>	
					<td class="w">
						<div id="vwriter">
							<span>작성자 | ${requestScope.galHoView['id'] }</span> 
						</div>
						<div id="vreply">
							<span>댓글 |	${requestScope.replyCount }</span>
						</div>						
						<div id="vcounts">
							<span>조회수 | ${requestScope.galHoView['counts']}</span>
						</div>
						<div id="vdate">
							<span>작성일 | ${requestScope.galHoView['reg_date']}</span>
						</div>
					
					</td>
					
					
				</tr>
				<tr>
					<td id="cot" colspan="4">${requestScope.galHoView['contents']}</td>
				</tr>
			</table>
		</div>
		<div id="galHo_btn1">
			<input type="button" id="goList" value="목록보기">
			<c:if test="${(member['id'] eq 'admin') &&  (member['id'] ne null)}">
				<input type="button" id="update" value="수정">
				<input type="button" id="delete" value="삭제">
			
			</c:if>
			
		</div>
		<br id="replyLine">
		<div id="replycont_all">
			
			<div id="replycont">
				<textarea rows="15" cols="100" style="width:95%; height:100px;" id="contents" name="contents"></textarea>			
			</div>
			<div id="replybtn">
				<c:if test="${member.id ne null }">
					<input type="button" id="replyWrite" value="댓글달기">
				</c:if>
			</div>
			
		</div>
		
		<div id="galHoReplyList">
			
		</div>
	</div>
	<!-- footer -->
	<%@ include file="../temp/footer.jspf" %>

</body>


<script type="text/javascript">
	$(function() {
		var check2=false;
		
		$("#replyWrite").click(function(){
			
				if($("#contents").val() == ""){
					alert("댓글 내용을 입력해 주세요");
					
				}else{
					
				
				$.ajax({url:"galHoReplyWrite.ghre",
						type : "POST",
						data : {contents: $("#contents").val(),
								ref: "${requestScope.galHoView['num']}",	
								id: '${member.id}',
								curPage:"1"
						},
						success: function(result) {
							result = result.trim();
							$("#contents").val("");
							$("#galHoReplyList").append(result);
						}
				});
				check2=true;
				}
				return check2;
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$("#goList").click(function() {
			
			location.href="galHoList.gh?curPage=${param.curPage}"; 
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$("#update").click(function() {
			location.href="galHoView.gh?num=${requestScope.galHoView['num']}&check=update&curPage=${param.curPage}";
		});
	});
</script>
<script type="text/javascript">
$(function() {
	$("#delete").click(function() {
		location.href="galHoDelete.gh?num=${requestScope.galHoView['num']}&curPage=${param.curPage}";
	});
});
</script>
</html>