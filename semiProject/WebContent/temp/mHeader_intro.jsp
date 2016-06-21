<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">
<%-- 	$(function(){
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
		$("#_01").text("Introduction");
	});

	$(function () {
		$("#_02").text("Service");
		
	});
	
	$(function () {
		$("#_03").text("Location");
		
	});
	$(function () {
		$("#title1").text("Introduction");
		
	});
<%-- $(function(){
		
		$("#_01").click(function(){
			location.href="<%=application.getContextPath()%>/intro/intro2.jsp";
			
		});	
		
		$("#_02").click(function(){
			location.href="<%=application.getContextPath()%>/intro/service.jsp";
			
		});	
		
		$("#_03").click(function(){
			location.href="<%=application.getContextPath()%>/intro/location.jsp";
			
		});	
		

	}); --%>
	
	
</script>
<style type="text/css">
	@import url("/semiProject/css/mCss_01.css");
	#title{
		text-align: center;
	}
</style>


	<div id="modal_01">
	<div id="line_01"></div>
		<div id="modal_02">
			<div id="modal_03">
				<div id="title1">
				
				</div>
				<div id="close">
					
				</div>
			</div>
			<hr id="line_02">
			<div id="modal_04">
				<div class="btn_hr" id="_01" style="cursor: pointer;"><a href="<%=application.getContextPath()%>/intro/intro2.jsp"></a></div>
				<div class="btn_hr" id="_02" style="cursor: pointer;"><a href="<%=application.getContextPath()%>/intro/service.jsp"></a></div>
				<div class="btn_hr" id="_03" style="cursor: pointer;"><a href="<%=application.getContextPath()%>/intro/location.jsp"></a></div>
			</div>
		</div>
	</div>


