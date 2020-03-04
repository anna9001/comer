<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8">
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



<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/comer/resources/assets/js/jquery.form.min.js"></script>
<script type="text/javascript">

function login() {

     var id=$('#id').val();
     var pw=$('#pw').val();
	    $.ajax({
			type:"POST",
			url:"login_ok.action",
			headers:{'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')},
			data:{id:id,pw:pw},
			success:function(response){
				if(response=="N"){
					alert("잘못된 사용자정보입니다."); return;
				}
				window.location.href="/comer/";
			},
			error:function(error,status,xhr){
				alert(err+status+xhr);
			}
		});		
} 

</script>
</head>

<body>
  <header>
 	<div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <!-- logo -->
          <a class="brand logo" href="/comer"><img src="/comer/resources/assets/img/comerlogo45.png" alt=""></a>
          <!-- end logo -->
          <!-- top menu -->
          <div class="navigation">
            <nav>
              <ul class="nav topnav">
                <li class="dropdown active">
                  <a href="#">Home</a>
                </li>
                <li class="dropdown">
                  <a href="/comer/restaurant">채식식당</a>
                  <ul class="dropdown-menu">
                  	<li><a href="">지역검색</a></li>
                  	<li><a href="">메뉴검색</a></li>
                    
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#">커뮤니티</a>
                  <ul class="dropdown-menu">                 
                    <li><a href="/comer/together.action">같이가요</a></li>
                 <!--    <li><a href="talk.action">자유게시판</a></li>  -->
                    <li><a href="/comer/news.action">채식뉴스</a></li>            
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#">꼬메르</a>
                  <ul class="dropdown-menu">
                    <li><a href="/comer/comerintro.action">회사소개</a></li>
                    <li><a href="/comer/veganintro.action">채식소개</a></li>
                  </ul>
                </li>
                <li class="dropdown">
                 <!-- 세션에 member 정보 유무따라 login_ok.action에서 받음 -->
                 
                <c:choose>
               		<c:when test="${empty  sessionScope.memDTO}">
               		 <a href="/comer/login.action">로그인/회원가입</a>
               		</c:when>     	
               		<c:otherwise>
               		  <li><a href="myPage.action">마이페이지</a></li>
               			<li> <a href="logout.action">로그아웃</a></li>
               		</c:otherwise>	       
               	</c:choose>    		
                </li>
          
              </ul>
              
            </nav>
          </div>
          <!-- end menu -->
        </div>
      </div>
    </div>
  </header>
  <br><br>
 
  <section id="maincontent">
    <div class="container">
     <div class="row">
        <div class="span12">
          <div class="tagline centered">
            <div class="row">
              <div class="span12">
                <div class="tagline_text">
			 		<h3 >로 그 인</h3><br/>
			 		  	<input type="text" id="id"  name="id" style="height:40px;" placeholder="아이디"/><br/>
					  	<input type="password" id="pw" name="pw" style="height:40px;" placeholder="비밀번호"/><br/>
			  	
			  			<p id="errorMsg" > </p>
					  	<div class="custom-control custom-checkbox">
							<input type="checkbox" id="jb-checkbox" class="custom-control-input">
							<label class="custom-control-label" for="jb-checkbox">아이디저장</label>		
						</div>
									
						<div class="custom-control custom-checkbox">
							<input type="checkbox" id="jb-checkbox2" class="custom-control-input">
							<label class="custom-control-label" for="jb-checkbox2">자동로그인</label>
						</div>
						<br>
						
						
						<meta name="_csrf" content="${_csrf.token}"> 	  
					  <input type="button" onclick="login();"  class="btn btn-outline-success" value="로그인">	
					  <br/><br/>
					  <a href="join.action" >회원가입</a>
				
				</div>
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
  
  	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		
		

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