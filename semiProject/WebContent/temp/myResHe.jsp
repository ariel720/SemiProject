<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<%-- <script type="text/javascript">
	$(function(){
		$(".btn_hr2m").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_012m").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$(".btn_hr2m").css("color", "#8877d5");
		$("#_012m").css("color", "white");
		$(".btn_hr2m").on("click", function(){
			$index = $(this).index();
			if($(".btn_hr2m").each(function(i){
				if(i == $index){
					$(this).css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
					$(this).css("color", "white");
				}else{
					$(this).css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
					$(this).css("color", "#8877d5");
				}
			}));
		});
	});
</script> --%>

<link href="<%=application.getContextPath() %>/css/mCssm.css" rel="stylesheet">

	<div id="modal_012m">
	<div id="line_012m"></div>
		<div id="modal_022m">
			<div id="modal_032m">
				<div id="title2m">
					
				</div>
			</div>
			<hr id="line_022m">
			<div id="modal_042m">
				<a href="<%= application.getContextPath() %>/mem/myInfo.jsp"><div class="btn_hr2m" id="_01m"></div></a>
				<a href="<%= application.getContextPath() %>/res/list_m.res?cp=1"><div class="btn_hr2m" id="_02m"></div></a>
				</form>
			</div>
		</div>
	</div>
