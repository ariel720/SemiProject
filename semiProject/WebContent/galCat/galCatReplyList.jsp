<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function goUp(data) {
		var relist = document.getElementById("ViewReList"+data);
		var update = document.getElementById("UpdateRe"+data);
		relist.style.display="none";
		update.style.display="inline-block";
	}
	function goBack(data) {
		var relist = document.getElementById("ViewReList"+data);
		var update = document.getElementById("UpdateRe"+data);
		relist.style.display="inline-block";
		update.style.display="none";
		
	}
	function goDel(data) {
		var num2= document.getElementById("num"+data).value;
		var ref2= document.getElementById("ref"+data).value;
		$(function() {
			$.ajax({url:"galCatReplyDelete.gcre",
					type:"POST",
					data:{
						num : num2,
						ref : ref2
					},
					success: function(result) {
						result = result.trim();
						$("#galCatReplyList").html(result);
					}
				
			});
		}); 
	}
	function Upcom(data) {
		var num2= document.getElementById("num"+data).value;
		var ref2= document.getElementById("ref"+data).value;
		var check3 = false;
		var contents2 = document.getElementById("contents"+data).value;
		if(contents2 != ""){
		$(function() {
			$.ajax({url:"galCatReplyUpdate.gcre",
					type:"POST",
					data:{
						num : num2,
						contents : contents2,
						ref : ref2,
					},
					success: function(result) {
						result = result.trim();
						$("#galCatReplyList").html(result);
					}
				
			});
		}); 
			check3= true;
		}else{
			alert("수정할 내용을 적어주세요.");
			check3 = false;
		}
		return check3;
	} 
</script>
<style type="text/css">
.ViewReplyList{
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
/*----------------------------  */
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
</style>
<c:forEach items="${requestScope.replyList }" var="relist"  varStatus="t">
<div id="viewreall">
	<div id="ViewReList${t.index}" class="ViewReplyList">
		<div id="ViewReplyListall">
		<table class="view_tab">
			<tr>
				<td id="review_id" name="id">${relist['id'] }
				<input type="hidden" id="num${t.index}" name="num" value="${relist['num'] }">
				<input type="hidden" id="ref${t.index }" name="ref" value="${relist['ref'] }">
				</td> 
				<td id="review_cont" name="contents">${relist['contents'] }</td> 
				<td id="review_date" name="reg_date">${relist['reg_date']}</td>
			</tr>
		</table>
		<div id="view_tab_btn">
		<c:if test="${(member.id eq 'admin') || (member.id eq relist['id'])}">
			<c:if test="${member.id eq relist['id'] }">
				<input class="reply_btn" type="button" value="수정" class="reupdate" onclick="goUp(${t.index})">
			</c:if>
				<input class="reply_btn" type="button" value="삭제" onclick="goDel(${t.index})">		
		</c:if>
		</div>
		</div>
	</div>
	<div id="UpdateRe${t.index}" class="UpdateReply">
		<div id="UpdateReplyall">
		<table> 
			<tr>
				<td name="id">${relist['id'] }
				<input type="hidden" id="num${t.index}" name="num" value="${relist['num'] }">
				<input type="hidden" id="ref${t.index }" name="ref" value="${relist['ref'] }">
				<td id="review_cont" name="contents"><textarea rows="15" cols="100" style="width:115%; height:100px;" id="contents${t.index }" name="contents">${relist['contents'] }</textarea></td> 
			</tr>
		</table>
		<input type="button" onclick="return Upcom(${t.index})" value="완료">
		<input type="button" onclick="goBack(${t.index})" value="취소">
		</div>
	</div>
</div>
</c:forEach>
