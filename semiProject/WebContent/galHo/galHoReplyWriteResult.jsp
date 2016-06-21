<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.UpdateReply{
	border-top: black dashed 1px;
	width: 100%;
	background-color:#dcdcdc;
	text-align: right;
	overflow: hidden;
}
#UpdateReplyall{
	padding-top: 10px;
}

#viewreall2{
	border-top: black dashed 1px;
	width: 100%;
	height:100px;	
	background-color:#dcdcdc;
	text-align: right;
	overflow: hidden;
	
}
.reply_btn{
}
.view_tab{
	margin-top:30px;
	width: 100%;	
	background-color:#dcdcdc; 
	border-spacing: 0px;
	border-collapse: collapse;
	border: none;
	margin-bottom: 5px;
}
#view_tab_btn{
	background-color: #dcdcdc;
}
.view_tab td{
	
}
#review_id{
	float: left;
	margin-left :10px;
}
#review_cont{
	float: left;
	margin-left: 50px;
}
#review_date{
	float: right;
	text-align: center;
	
}
</style>
<script type="text/javascript">
function goDel3() {

	$(function() {
		$.ajax({url:"galHoReplyDelete.ghre",
				type:"POST",
				data:{
					num : "${requestScope.replyHo['num'] }",
					ref : "${requestScope.replyHo['ref'] }"
				},
				success: function(result) {
					result = result.trim();
					$("#galHoReplyList").html(result);
				}
			
		});
	}); 
}
</script>

<script type="text/javascript">
	function goUp2() {
		var relist = document.getElementById("viewreall2");
		var update = document.getElementById("UpdateRe");
		relist.style.display="none";
		update.style.display="inline-block";
	}
	function goBack2() {
		var relist = document.getElementById("viewreall2");
		var update = document.getElementById("UpdateRe");
		relist.style.display="inline-block";
		update.style.display="none";
		
	}
	
	function Upcom2() {
		var cont = document.getElementById("contents5").value;
		var check4 = false;
		if(cont != ""){
		var content = $("#contents5").val();
		$(function() {
			$.ajax({url:"galHoReplyUpdate.ghre",
					type:"POST",
					data:{
						num : "${requestScope.replyHo['num'] }",
						contents : content,
						ref : "${requestScope.replyHo['ref'] }"
					},
					success: function(result) {
						result = result.trim();
						$("#galHoReplyList").html(result);
					}
				
			});
		});
		check4 = true;
		}else{
			
			alert("수정할 댓글을 다시 입력해 주세요.");
			check4= false;
		}
		return check4;
	} 
</script>

	<div id="viewreall2">
	<table class="view_tab">
		<tr>
			<td id="review_id" name="id">${requestScope.replyHo['id'] }
				<input type="hidden" id="num3" name="num" value="${requestScope.replyHo['num'] }">
				<input type="hidden" id="ref3" name="ref" value="${requestScope.replyHo['ref'] }"></td> 
			<td id="review_cont" name="contents">${requestScope.replyHo['contents'] }</td> 
			<td id="review_date" name="reg_date">${requestScope.replyHo['reg_date']}</td>
		</tr>
	</table>
		<div id="view_tab_btn">
			<c:if test="${(member.id eq 'admin') || (member.id eq requestScope.replyHo['id'])}">
				<c:if test="${member.id eq requestScope.replyHo['id'] }">
					<input class="reply_btn" type="button" value="수정" class="reupdate" onclick="goUp2()">
				</c:if>
				
				<input class="reply_btn" type="button" value="삭제" onclick="goDel3()">
			</c:if>
		</div>
	</div>
	<div id="UpdateRe" class="UpdateReply">
		<div id="UpdateReplyall">
		<table>
			<tr>
				<td>${requestScope.replyHo['id'] }
				<%-- <input type="hidden" id="num" name="num" value="${requestScope.replyHo['num'] }">
				<input type="hidden" id="ref" name="ref" value="${requestScope.replyHo['ref'] }"> --%></td>
				<td><textarea id="contents5" rows="15" cols="100" style="width:100%; height:100px;">${requestScope.replyHo['contents']}</textarea></td> 
			</tr>
		</table>
		<input type="button" onclick="return Upcom2()" value="완료">
		<input type="button" onclick="goBack2()" value="취소">
		</div>
	</div>
