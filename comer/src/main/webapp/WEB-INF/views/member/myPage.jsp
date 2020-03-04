<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8">
  <meta name="_csrf" content="${_csrf.token}">
  <title>Serenity - Modern bootstrap website template</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- styles -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">
  <link href="/comer/resources/assets/css/bootstrap.css" rel="stylesheet">
  <link href="/comer/resources/assets/css/bootstrap-responsive.css" rel="stylesheet">
  <link href="/comer/resources/assets/css/docs.css" rel="stylesheet">
  <link href="/comer/resources/assets/css/prettyPhoto.css" rel="stylesheet">
  <link href="/comer/resources/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
  <link href="/comer/resources/assets/css/flexslider.css" rel="stylesheet">
  <link href="/comer/resources/assets/css/sequence.css" rel="stylesheet">
  <link href="/comer/resources/assets/css/style.css" rel="stylesheet">
  <link href="/comer/resources/assets/color/default.css" rel="stylesheet">

  <!-- fav and touch icons -->
  <link rel="shortcut icon" href="resources/assets/ico/favicon.ico">
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/comer/resources/assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/comer/resources/assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/comer/resources/assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="/comer/resources/assets/ico/apple-touch-icon-57-precomposed.png">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

  <!-- =======================================================
    Theme Name: Serenity
    Theme URL: https://bootstrapmade.com/serenity-bootstrap-corporate-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->

<style type="text/css">

.{
text-align:center;
display: inline-block;
float:center;
}

#login_wrapper{
    display: flex;
    height: 100vh;
    justify-content: center; /*가로에서 가운데에 요소(자식요소)를 배치하겠다*/
    align-items: center; /* 세로에서 가운데에 요소를 배치하겠다 */
    border: solid 1px gray;
}

</style>
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-messages.js"></script>
 -->
<script type="text/javascript" src="./resources/js/RSA/jsbn.js"></script>
<script type="text/javascript" src="./resources/js/RSA/rsa.js"></script>
<script type="text/javascript" src="./resources/js/RSA/prng4.js"></script>
<script type="text/javascript" src="./resources/js/RSA/rng.js"></script>	

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>

li{
align:left;
text-align:left;
}

</style>

<script type="text/javascript">

$(function(){
	$('#checkPart').click(function(){
		var id=$("#id").val();
		var no=$("#no").val();
		
		$.ajax({
			type:"POST",
			headers: {'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')},
			url:"/comer/checkParti.action",
			data:{no:no,id:id}, 
			success:function(response){
				alert(response.size);
				alert(lists);
				alert(message);
				$('#result')[0].innerHTML = response.message;
			},
			error:function(request,status,error){
				alert(request.status);
			}			
		});
		
	});
});
</script>
</head>

<body>
  <header>
	<jsp:include page="../header.jsp" />
  </header>
  <br><br>
   <br><br>
  <section id="maincontent">
    <div class="container">
     <div class="row">
        <div class="span12">
          <div class="tagline centered">
            <div class="row">
              <div class="span12">
                <div class="tagline_text">
                <br><br>
			 		<h5 style="text-align:left;">내가 작성한 글</h5>
			 		
			 			<ul>	 	
			 			
			 				<c:choose>		
				 				<c:when test="${!empty writeList}">	
					 				<c:forEach var="lists" items="${writeList }">
					 				<li> 제목: <a href="/comer/togeRead.action?no=${lists.no }">	${lists.subject } </a>/ 작성일:  ${lists.created } 					 
					 				<input type="hidden" id="no" value="${lists.no }"/>
					 				<a id="checkPart"> 인원보기</a>
					 				<div id="result"></div>
					 				</li>
					 				
					 				</c:forEach>
				 				</c:when>	
					 			<c:otherwise>
					 				<p>	등록한 글이 없습니다. </p>
					 			</c:otherwise>					
			 				</c:choose>
			 				</ul>
			 			<h5 style="text-align:left;">참여중인 모임</h5>	
			 				
			 			<ul> 				
							<c:choose>		
				 				<c:when test="${!empty partiList}">	
					 				<c:forEach var="lists" items="${partiList }">
					 				<li><a href="/comer/togeRead.action?no=${lists.no }"> 제목:  ${lists.subject }</a> / 모임일:  ${lists.eventDate } <a class="btn btn-success" id="cancel">참여 취소</a></li>
					 				</c:forEach>
				 				</c:when>	
					 			<c:otherwise>
					 				<p>	참여중인 모임이 없습니다. </p>
					 			</c:otherwise>					
			 				</c:choose>
			 			
			 			
			 			</ul>
						
			  </div>
			</div>
		  </div>
		</div>
	  </div>		  
	</div>
  </section>
  					  
	
    <br><br>
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
              <li><a href="#">Minim timeam has no aperiri sanctus ei mea per pertinax</a></li>
              <li><a href="#">Te malorum dignissim eos quod sensibus</a></li>
            </ul>
          </div>
        </div>
        <div class="span4">
          <div class="widget">
            <!-- logo -->
            <a class="brand logo" href="index.jsp">
							<img src="/comer/resources/assets/img/logo-dark.png" alt="">
						</a>
            <!-- end logo -->
            <address>
							<strong>Registered Companyname, Inc.</strong><br>
							 8895 Somename Ave, Suite 600<br>
							 San Francisco, CA 94107<br>
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
            <p>
              &copy; Serenity - All right reserved
            </p>
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
  
  	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		
		
  <script src="/comer/resources/assets/js/jquery.min.js"></script>
  <script src="/comer/resources/assets/js/jquery.easing.js"></script>
  <script src="/comer/resources/assets/js/google-code-prettify/prettify.js"></script>
  <script src="/comer/resources/assets/js/modernizr.js"></script>
  <script src="/comer/resources/assets/js/bootstrap.js"></script>
  <script src="/comer/resources/assets/js/jquery.elastislide.js"></script>
  <script src="/comer/resources/assets/js/sequence/sequence.jquery-min.js"></script>
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