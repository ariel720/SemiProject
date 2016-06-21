<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
var slideIndex = 1;
showSlides(slideIndex);


function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var s1 = document.getElementsByClassName("ms11");
  var d1 = document.getElementsByClassName("dot");
  
  for (i = 0; i < s1.length; i++) {
     s1[i].style.display = "none";  
  }
  for (i = 0; i < d1.length; i++) {
     d1[i].classList.remove("active");
  }
  s1[n-1].style.display = "block";  
  d1[n-1].classList.add("active");
}



//=====================================================

function currentSlide2(n) {
  showSlides2(slideIndex = n);
}


function showSlides2(n) {
	  var i;
	  var s2 = document.getElementsByClassName("ms2");
	  var d2 = document.getElementsByClassName("dot2");
	  
	  for (i = 0; i < s2.length; i++) {
	     s2[i].style.display = "none";  
	  }
	  for (i = 0; i < d2.length; i++) {
	     d2[i].classList.remove("active");
	  }
	  s2[n-1].style.display = "block";  
	  d2[n-1].classList.add("active");
	}
	
//=====================================================

function currentSlide3(n) {
  showSlides3(slideIndex = n);
}


function showSlides3(n) {
	  var i;
	  var s3 = document.getElementsByClassName("ms3");
	  var d3 = document.getElementsByClassName("dot3");
	  
	  for (i = 0; i < s3.length; i++) {
	     s3[i].style.display = "none";  
	  }
	  for (i = 0; i < d3.length; i++) {
	     d3[i].classList.remove("active");
	  }
	  s3[n-1].style.display = "block";  
	  d3[n-1].classList.add("active");
	}
	



</script>
<style type="text/css">
	#pinner_nav>li{
		float: left;
		margin-right: 80px;
		font-weight: bolder;
		color: gray;
	}
	#pinner_nav_u1 li,#pinner_nav_u2 li,#pinner_nav_u3 li,#pinner_nav_u4 li,#pinner_nav_u5 li,#pinner_nav_u6 li,#pinner_nav_u7 li{
		margin-top: 15px;
		margin-bottom:5px;
		font-weight: lighter;
	}
</style>
<style type="text/css">

#img{
width: 821px;
height: 320px;
margin: 0 auto;
}
* {box-sizing:border-box}


/* Slideshow container */
.slideshow-container,.container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

#m12, #m13{
	display: none;
}


/* The dots/bullets/indicators */
.dot, .dot2, .dot3 {
  cursor:pointer;
  height: 13px;
  width: 13px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot2:hover, .dot3:hover, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
   opacity : 100 !important;
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .slprev, .slnext,.text {font-size: 11px}
}

#i1,#i2,#i3{
display: none;
}
#s_change{
	margin-top: 50px;
}


</style>


<script type="text/javascript">
$(function() {
	$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_03").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_02").css("color", "white");
	$("#_03").css("color", "#8877d5");
	$("#_01").css("color", "#8877d5");
	$("#_01").click(function(){
		location.href="<%=application.getContextPath()%>/intro/intro2.jsp";
	});
	$("#_03").click(function(){
		location.href="<%=application.getContextPath()%>/intro/location.jsp";
	});
});


</script>
<!-- header -->
	<%@ include file="../temp/header.jspf" %>
</head>
<body id="body">

<%@ include file="../temp/mHeader_intro.jsp" %>
<div id="s_change">
<div class="slideshow-container">
<div class="ms11 fade">
  <img  src="<%=application.getContextPath() %>/image/sh/intro/serv1.jpg" style="width:100%">
  
</div>

<div class="ms11 fade" id="m12" style="opacity : 100;">  
  <img src="<%=application.getContextPath() %>/image/sh/intro/serv2.jpg" style="width:100%">  
</div>

<div class="ms11 fade" id="m13" style="opacity : 100;">  
  <img src="<%=application.getContextPath() %>/image/sh/intro/serv3.jpg" style="width:100%"> 
</div>


</div>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<br>
<div class="container">
<img src="<%=application.getContextPath() %>/image/sh/intro/serv_text4.jpg" style="width:100%"> 
</div>
<br>


<div class="slideshow-container">
<div class="ms2 fade">
  <img src="<%=application.getContextPath() %>/image/sh/intro/serv5.jpg" style="width:100%"> 
</div>

<div id="i1" class="ms2 fade">  
  <img  src="<%=application.getContextPath() %>/image/sh/intro/serv6.jpg" style="width:100%" >  
</div>
</div>
<div style="text-align:center">
  <span class="dot2" onclick="currentSlide2(1)"></span> 
  <span class="dot2" onclick="currentSlide2(2)"></span> 
</div>


<br>
<div class="container">
<img src="<%=application.getContextPath() %>/image/sh/intro/serv_text7.jpg" style="width:100%"> 
</div>
<br>



<div class="slideshow-container">
<div class="ms3 fade">
  <img src="<%=application.getContextPath() %>/image/sh/intro/serv8.jpg" style="width:100%" > 
</div>

<div id="i2" class="ms3 fade">  
  <img   src="<%=application.getContextPath() %>/image/sh/intro/serv9.jpg" style="width:100%">
</div>
<div id="i3" class="ms3 fade">  
  <img  src="<%=application.getContextPath() %>/image/sh/intro/serv10.jpg" style="width:100%">
</div>
</div>
<div style="text-align:center">
  <span class="dot3" onclick="currentSlide3(1)"></span> 
  <span class="dot3" onclick="currentSlide3(2)"></span>
  <span class="dot3" onclick="currentSlide3(3)"></span> 
</div>


<br>
<div class="container">
<img src="<%=application.getContextPath() %>/image/sh/intro/serv_text11.jpg" style="width:100%"> 
</div>
<br>

</div>
<!-- footer -->
	<%@ include file="../temp/footer.jspf" %>




</body>
</html>