<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<meta charset="utf-8">
<title>Serenity - Modern bootstrap website template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- styles -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700"
	rel="stylesheet">
<link href="/comer/resources/assets/css/bootstrap.css" rel="stylesheet">
<link href="/comer/resources/assets/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="/comer/resources/assets/css/docs.css" rel="stylesheet">
<link
	href="/comer/resources/assets/js/google-code-prettify/prettify.css"
	rel="stylesheet">
<link href="/comer/resources/assets/css/style.css" rel="stylesheet">
<link href="/comer/resources/assets/color/default.css" rel="stylesheet">

<!-- fav and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/comer/resources/assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/comer/resources/assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/comer/resources/assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="/comer/resources/assets/ico/apple-touch-icon-57-precomposed.png">

<!-- =======================================================
    Theme Name: Serenity
    Theme URL: https://bootstrapmade.com/serenity-bootstrap-corporate-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
<link href="/comer/resources/assets/css/boardRead.css" rel="stylesheet">
<script src="/comer/resources/assets/js/jquery.min.js"></script>

<style>
#table1{
width:50%;
float:left;
border-collapse: separate;
border-spacing: 0 20px;
}

#table2{
 width:50%;
float:left;
}

#td1{
width:60px;
}
#td2{
width:150px;
}
</style> 
<script type="text/javascript">
$(document).ready(function(){
	
	var no = $('#no').val();
	
	$('#updateInfo').click(function(){

		location.href="/comer/restaurant/update/no/"+no;
	
	}); //togeModi 수정

	$('#deleteInfo').click(function(){
	
		location.href="/comer/restaurant/delete/no/"+no;
		
	});
});

</script>
</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<header>
		<jsp:include page="../header.jsp" />
	</header>
	<!-- Subhead
================================================== -->
	<section id="subintro">
		<div class="jumbotron subhead" id="overview">
			<div class="container">
				<div class="row">
					<div class="span12">
						<div class="centered">
							<h3>식당 소개</h3>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="breadcrumb">
		<div class="container">
			<div class="row">
				<div class="span12">
					<ul class="breadcrumb notop">
						<li><a href="#">Home</a><span class="divider">/</span></li>
						<li class="active">Fullwidth</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<section id="maincontent">
		<div class="container">
			<div class="row">
			  <div class="tagline centered">
				   <div class="row">
			         <div class="span12">
		                <div class="tagline_text" >							
							<table>						
									<tr>			
										<td id="td1">번호</td>			
										<td id="sub">${dto.no}</td>
									</tr>								
									<tr>			
										<td id="td1">제목</td>			
										<td id="sub">${dto.subject }</td>
									</tr>
									<tr>								
										<td colspan="5" style="height:200px;">										
												${dto.content }									
										 </td>	
									</tr>
									<tr>							
									<c:if test="${!empty dto.fileName }">
										<td colspan="5" style="height:200px;">		
										<img src="<%=cp %>/resources/assets/images/news/${dto.fileName }" width="300" height="150">			
										</td>
									</c:if>
									</tr>
							</table>	
							<table>
								<tr>
								<td>이전글 </td>
								<c:if test="${!empty pre.no }">
									<td> ${pre.no } | ${pre.subject }</td>
								</c:if>
								<c:if test="${empty pre.no }">
									<td>이전글이 없습니다.</td>
								</c:if>
								</tr>		
								<tr>
								<td>다음글 </td>
								<c:if test="${!empty next.no }">
									<td> ${next.no } | ${next.subject }</td>
								</c:if>
								<c:if test="${empty next.no }">
									<td>다음글이 없습니다.</td>
								</c:if>
								</tr>							
							</table>		
						</div>
					</div>		
				</div>	
			</div>
		</div>		
	</div>
	<c:if test="${memDTO.id=='admin1' }">
			<table style="align:center">
				<tr>	
					<td><a class="btn btn-success"	id="updateInfo">수정하기</a>
					<a class="btn btn-success" id="deleteInfo">삭제하기</a></td>
				</tr>
			</table>
	</c:if>		
	</section>

	<br>
	<br>
	<br>


	<!-- Footer
 ================================================== -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="span4">
					<div class="widget">
						<h5>Browse pages</h5>
						<ul class="regular">
							<li><a href="#">Work for us</a></li>
							<li><a href="#">Creative process</a></li>
							<li><a href="#">Case study</a></li>
							<li><a href="#">Scaffold awwards</a></li>
							<li><a href="#">Meet the team</a></li>
						</ul>
					</div>
				</div>
				<div class="span4">
					<div class="widget">
						<h5>Recent blog posts</h5>
						<ul class="regular">
							<li><a href="#">Lorem ipsum dolor sit amet</a></li>
							<li><a href="#">Mea malis nominavi insolens ut</a></li>
							<li><a href="#">Minim timeam has no aperiri sanctus ei
									mea per pertinax</a></li>
							<li><a href="#">Te malorum dignissim eos quod sensibus</a></li>
						</ul>
					</div>
				</div>
				<div class="span4">
					<div class="widget">
						<!-- logo -->
						<a class="brand logo" href="index.html"> <img
							src="assets/img/logo-dark.png" alt="" />
						</a>
						<!-- end logo -->
						<address>
							<strong>Registered Companyname, Inc.</strong><br> 8895
							Somename Ave, Suite 600<br> San Francisco, CA 94107<br>
							<abbr title="Phone">P:</abbr> (123) 456-7890
						</address>
					</div>
				</div>
			</div>
		</div>
		<div class="verybottom">
			<div class="container">
				<div class="row">
					<div class="span6">
						<p>&copy; Serenity - All right reserved</p>
					</div>
					<div class="span6">
						<div class="credits">
							<!--
                All the links in the footer should remain intact.
                You can delete the links only if you purchased the pro version.
                Licensing information: https://bootstrapmade.com/license/
                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Serenity
              -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- JavaScript Library Files -->
	<script src="/comer/resources/assets/js/jquery.easing.js"></script>
	<script
		src="/comer/resources/assets/js/google-code-prettify/prettify.js"></script>
	<script src="/comer/resources/assets/js/modernizr.js"></script>
	<script src="/comer/resources/assets/js/bootstrap.js"></script>
	<script src="/comer/resources/assets/js/jquery.elastislide.js"></script>
	<script
		src="/comer/resources/assets/js/sequence/sequence.jquery-min.js"></script>
	<script src="/comer/resources/assets/js/sequence/setting.js"></script>
	<script src="/comer/resources/assets/js/jquery.prettyPhoto.js"></script>
	<script src="/comer/resources/assets/js/application.js"></script>
	<script src="/comer/resources/assets/js/jquery.flexslider.js"></script>
	<script src="/comer/resources/assets/js/hover/jquery-hover-effect.js"></script>
	<script src="/comer/resources/assets/js/hover/setting.js"></script>

	<!-- Template Custom JavaScript File -->
	<script src="/comer/resources/assets/js/custom.js"></script>


</body>

</html>
