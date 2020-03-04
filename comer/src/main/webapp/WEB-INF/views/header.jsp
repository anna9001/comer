<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- styles -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">
  <link href="/comer/resources/assets/css/bootstrap.css" rel="stylesheet">

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

</head>
<body>

    <!-- Navbar
    ================================================== -->
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
                  <a href="/comer">Home</a>
                </li>
                <li class="dropdown">
                  <a href="/comer/restaurant">채식식당</a>
                  <!-- <ul class="dropdown-menu">
                  	<li><a href="">지역검색</a></li>
                  	<li><a href="">메뉴검색</a></li>                  
                  </ul> -->
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
  
  
</body>
</html>