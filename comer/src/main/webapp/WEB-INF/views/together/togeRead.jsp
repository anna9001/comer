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

<link href="/comer/resources/assets/css/docs.css" rel="stylesheet">
<link href="/comer/resources/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
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
<link rel="stylesheet" href="/comer/resources/assets/css/calendar.css">

 <script src="/comer/resources/assets/js/jquery.min.js"></script>
 <style>
table {
	width: 100%;
	padding: 20px;
}

.contentTable {
	width: 60%;
	margin: 0;
	padding: 0;
	float: left;
}

.calendarTable {
	width: 38%;
	margin: 0;
	padding: 0;
	float: right;
	height:500px;
}

td {
	text-align: center;
}

#sub{
font-size:15px;
font-weight:bold;
}
#subLine{
border-bottom: 1px solid;
  border-collapse: separate;
  border-spacing: 0 10px;

}
#content {
	width: 100%;
}
#calSub{
margin:2%;
height:15%;
text-align:center;
}
#calbody{
margin:0;
height:60%;
}
</style> 
<script type="text/javascript">

$(function(){
	
	var no = $('#no').val();
	var uid= $('#uid').val();
	var wid= $('#wid').val();
	
	$('#togeModi').click(function(){

		if(uid==null||uid==""){alert("로그인이 필요합니다."); return;}
		if(uid!=wid) {alert("작성자 본인만 가능합니다."); return;}
	
		location.href="togeModi.action?pageNum="+${pageNum}+"&no="+no;
	
	}); //togeModi 수정
	
	$('#participate').click(function(){
		
		if(uid==null||uid==""){alert("로그인이 필요합니다."); return;}
		if(uid==wid) {alert("작성자 본인입니다."); return;}
		
		$.ajax({
			method:"POST",
			url:"participate.action",
			dataType:"TEXT",
			data:{id:uid,no:no},
			success:function(response){			
				alert(response);
			},
			error:function(response,status,error){
				alert(response +error)
			}
		});		
	}); //participate 참여
	
	$('#delete').click(function(){
		if(uid==null||uid==""){alert("로그인이 필요합니다."); return;}
		if(uid!=wid) {alert("작성자가 아닙니다."); return;}
		
		location.href="deleteToge.action?pageNum="+${pageNum}+"&no="+no;
		
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
							<h3>같이 가요!</h3>
							<p>다른 채식인들과 함께 채식 식당을 함께 방문해요</p>
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
				<div class="span12">
					<h3>같이 가요</h3>
					<div class="row">
						<div class="span12">
							<div class="priceBox">
								<table>
									<tr id="subLine">
										<td id="sub">번호</td>
										<td>${boardDTO.no }</td>
										<td id="sub">제목</td>
										<td>${boardDTO.subject }</td>
										<td id="sub">모임일</td>
										<td>${boardDTO.eventDate }</td>
										<td></td><td></td>
									</tr>
									<tr id="subLine">
										<td id="sub">아이디</td>
										<td>${boardDTO.id }</td>
										<td id="sub">등록일</td>
										<td>${boardDTO.created }</td>
										<td id="sub">조회수</td>
										<td>${boardDTO.hitCount }</td>
										<td id="sub">참여수</td>
										<td>${boardDTO.participant }</td>
									</tr>

									
									<table class="contentTable">
										<tr>
											<td colspan="5" style="height:200px;">
												<!-- <textarea style="width: 100%;" rows="8" id="content" name="content">
											 -->	${boardDTO.content }	
											 </td>	
										</tr>
										<tr >							
										<c:if test="${!empty boardDTO.fileName }">	
											<td colspan="5" style="height:200px;">																	
											<img src="<%=cp %>/resources/assets/images/togeBoard/${boardDTO.fileName }" width="300" height="150">																				
											</td></c:if>
										</tr>
									</table>
								
									<table class="calendarTable">
										<div class="calendar" >	
										<div id="calSub">
											<tr>
												<td colspan="7">
													<h4>달력</h4>
												</td>
											</tr>
											<tr>
												<td class="day sun">일</td>
												<td class="day">월</td>
												<td class="day">화</td>
												<td class="day">수</td>
												<td class="day">목</td>
												<td class="day">금</td>
												<td class="day sat">토</td>
											</tr>
										</div>
										<div id="calbody">
										<tr>
										
											<c:forEach var="calList" items="${calList }" varStatus="status">											
												<c:choose>
													<c:when test="${calList.value=='today' && !(status.index%7==0) }">				
														<td class="today" style="background-color:#c9c9c9;">
														<div class="date">${calList.date }</div>
														<div></div>
														</td>
														
													</c:when>
													<c:when test="${calList.date==eventDate  }">
														<td  class="eventDate" style="background-color:#94c045; ">
															<div class="date">${calList.date }</div>
															<div></div>
														</td>
													</c:when>
													<c:when test="${status.index%7==6 }">
														<td class="sat_day">
															<div class="sat">${calList.date }</div>
															<div></div>							
														</td>
													</c:when>									
												<c:when test="${status.index%7==0 }">
										</tr>
										<tr>
										
												<td class="sun_day">
													<div class="sun">
														${calList.date }<br />
													</div>
													<div></div>
												</td>
											</c:when>
												<c:otherwise>
													<td class="normal_day">
														<div class="date">${calList.date }</div>
														<div></div>
													</td>
												</c:otherwise>
											</c:choose>													
										</c:forEach>
										</tr>
										<div>
										<tr>
											<td colspan="7"><a class="btn btn-success" id="participate">참여하기</a>
											</td>		
										</tr>
										</div>
									</table>
					
								</table>

							</div>
						</div>

					</div>
					 <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/> 
					 <input type="hidden" id="uid" name="uid" value="${memDTO.id }"/> 
					<input type="hidden" id="wid" name="wid" value="${boardDTO.id }"/>
					<input type="hidden" id="no" name="no" value="${boardDTO.no }"/>
					<span class="emphasis-2">
					<a class="btn btn-success"	id="togeModi">수정하기</a></span> 
					<span class="emphasis-2"><a class="btn btn-success" id="delete">삭제하기</a></span>
					
				</div>
			</div>
		</div>
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
