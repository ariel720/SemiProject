<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">
	<%-- $(function(){
		$(".btn").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$(".btn").css("color", "#8877d5");
		$("#_01").css("color", "white");
		$(".btn").on("click", function(){
			$index = $(this).index();
			if($(".btn").each(function(i){
				if(i == $index){
					$(this).css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
					$(this).css("color", "white");
				}else{
					$(this).css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
					$(this).css("color", "#8877d5");
				}
			}));
		});
	}); --%>
	
	$(function () {
		$("#title2").text("Board");
		$("#_01").text("Notice Board");
	});

	$(function () {
		$("#_02").text("Free Board");
		
	});
	
	$(function(){
		$("#title2").text("Board");
		$("#_01").text("Notice Board");
		$("#_02").text("Free Board");
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
		$("#_01").click(function(){
			location.href="<%=application.getContextPath()%>/notice/list.nt?cp=1";
			
		});	
		
		$("#_02").click(function(){
			location.href="<%=application.getContextPath()%>/free/list.fr?cp=1";
			
		});	
		

	});	
	
</script>
<link href="/semiProject/css/mCss_02.css" rel="stylesheet">


	<div id="modal_01">
	<div id="line_01"></div>
		<div id="modal_02">
			<div id="modal_03">
				<div id="title">
					
				</div>
				<div id="close">
					
				</div>
			</div>
			<hr id="line_02">
			<div id="modal_04">
				<div class="btn_hr" id="_01" style="cursor: pointer;"><a href="<%=application.getContextPath()%>/notice/list.nt?cp=1">Notice board</a></div>
				<div class="btn_hr" id="_02" style="cursor: pointer;"><a href="<%=application.getContextPath()%>/free/list.fr?cp=1">Free board</a></div>
			</div>
		</div>
	</div>

