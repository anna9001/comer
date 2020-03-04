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
  <link href="/comer/resources/webapp/assets/css/bootstrap-responsive.css" rel="stylesheet">
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

  <!-- =======================================================
    Theme Name: Serenity
    Theme URL: https://bootstrapmade.com/serenity-bootstrap-corporate-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
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
  </header>
  
  <section id="intro">
    <div class="jumbotron masthead">
      <div class="container">
        <!-- slider navigation -->
        <div class="sequence-nav">
          <div class="prev">
            <span></span>
          </div>
          <div class="next">
            <span></span>
          </div>
        </div>
        <!-- end slider navigation -->
        <div class="row">
          <div class="span12">
            <div id="slider_holder">
              <div id="sequence">
                <ul>
                  <!-- Layer 1 -->
                  <li>
                   <div class="info animate-in">
                     <h3>소식</h3>
                     
                      <br> <br>
                      <c:choose>
                      <c:when test="${empty newslist }">
                     		   최신 채식 뉴스가 없습니다.
                     
                      </c:when>
                      <c:otherwise>
               		     <c:forEach var="newslist" items="${newslist }">
                  	   <p>${newslist.no } |  ${newslist.subject } </p>
                      </c:forEach>
                      </c:otherwise>
                      </c:choose>
                       <br><br>
                      <a class="btn btn-success" href="/comer/news.action">Learn more &raquo;</a>
                    </div> 
   			   <img class="slider_img" src="/comer/resources/assets/img/slides/sequence/Vegan-Marco-Laterza-768x519.jpg" alt="">
                  </li>
                  <!-- Layer 2 -->
                 <!--  <li>
                    <div class="info">
                      <h2>Smart and fresh</h2>
                      <br>
                      <h3>Rich of features</h3>
                      <p>
                        Lorem ipsum dolor sit amet, munere commodo ut nam, quod volutpat in per. At nec case iriure, consul recteque nec et.
                      </p>
                      <a class="btn btn-success" href="#">Learn more &raquo;</a>
                    </div>
     <img class="slider_img" src="/comer/resources/assets/img/slides/sequence/.jpg" alt="">
                  </li> -->
                  <!-- Layer 3 -->
                  
                </ul>
              </div>
            </div>
            <!-- Sequence Slider::END-->
          </div>
        </div>
      </div>
    </div>
  </section>
  <section id="maincontent">
    <div class="container">
      <div class="row">
        <div class="span3 features">
          <i class="icon-circled icon-32 icon-suitcase left active"></i>
          <h4>채식 식당</h4>
          <div class="dotted_line">
          </div>
          <p class="left">
            Dolorem adipiscing definiebas ut nec. Dolore consectetuer eu vim, elit molestie ei has, petentium imperdiet in pri mel virtute nam.
          </p>
          <a href="#">Learn more</a>
        </div>
        <div class="span3 features">
          <i class="icon-circled icon-32 icon-plane left"></i>
          <h4>같이 가요</h4>
          <div class="dotted_line">
          </div>
          <p class="left">
            Dolorem adipiscing definiebas ut nec. Dolore consectetuer eu vim, elit molestie ei has, petentium imperdiet in pri mel virtute nam.
          </p>
          <a href="#">Learn more</a>
        </div>
        <div class="span3 features">
          <i class="icon-circled icon-32 icon-leaf left"></i>
          <h4>자유게시판</h4>
          <div class="dotted_line">
          </div>
          <p class="left">
            Dolorem adipiscing definiebas ut nec. Dolore consectetuer eu vim, elit molestie ei has, petentium imperdiet in pri mel virtute nam.
          </p>
          <a href="#">Learn more</a>
        </div>
        <div class="span3 features">
          <i class="icon-circled icon-32 icon-wrench left"></i>
          <h4>꼬메르</h4>
          <div class="dotted_line">
          </div>
          <p class="left">
            Dolorem adipiscing definiebas ut nec. Dolore consectetuer eu vim, elit molestie ei has, petentium imperdiet in pri mel virtute nam.
          </p>
          <a href="#">Learn more</a>
        </div>
      </div>
      <div class="row">
        <div class="span12">
          <div class="tagline centered">
            <div class="row">
              <div class="span12">
                <div class="tagline_text">
                  <h2>Don't miss this special offer for limited time only!</h2>
                  <p>
                    Lorem ipsum dolor sit amet, vix ceteros noluisse intellegat ne, ex nec insolens liberavisse, no adhuc causae nominati duo.
                  </p>
                </div>
                <div class="btn-toolbar cta">
                  <a class="btn btn-large btn-color" href="#">
							<i class="icon-plane icon-white"></i> Try free version </a>
                  <a class="btn btn-large btn-inverse" href="#">
							<i class="icon-shopping-cart icon-white"></i> Buy license </a>
                </div>
              </div>
            </div>
          </div>
          <!-- end tagline -->
        </div>
      </div>
<!--   <div class="row">
        <div class="home-posts">
          <div class="span12">
            <h3>Recent blog posts</h3>
          </div>
          <div class="span3">
            <div class="post-image">
              <a href="post_right_sidebar.jsp">
					<img src="/comer/resources/webapp/assets/img/dummies/blog1.jpg" alt="">
					</a>
            </div>
            <div class="entry-meta">
              <a href="#"><i class="icon-square icon-48 icon-pencil left"></i></a>
              <span class="date">Sep 17 <br>
					2013</span>
            </div>
    end .entry-meta 
            <div class="entry-body">
              <a href="post_right_sidebar.jsp">
                <h5 class="title">This is a standard post</h5>
              </a>
              <p>
                Lorem ipsum dolor sit amet nec, consectetuer adipiscing elit. Aenean commodo ligula eget dolor aenean massa.
              </p>
            </div>
    end .entry-body 
            <div class="clear">
            </div>
          </div>
          <div class="span3">
            <div class="post-image">
              <a href="#"><img src="/comer/resources/webapp/assets/img/dummies/blog2.jpg" alt=""></a>
            </div>
            <div class="entry-meta">
              <a href="#"><i class="icon-square icon-48 icon-pencil left"></i></a>
              <span class="date">Sep 17 2013</span>
            </div>
    end .entry-meta 
            <div class="entry-body">
              <a href="post_right_sidebar.jsp">
                <h5 class="title">Example post image format</h5>
              </a>
              <p>
                Lorem ipsum dolor sit amet nec, consectetuer adipiscing elit. Aenean commodo ligula eget dolor aenean massa.
              </p>
            </div>
     end .entry-body 
            <div class="clear">
            </div>
          </div>
          <div class="span3">
            <div class="post-image">
              <a href="#"><img src="/comer/resources/webapp/assets/img/dummies/blog2.jpg" alt=""></a>
            </div>
            <div class="entry-meta">
              <a href="#"><i class="icon-square icon-48 icon-facetime-video left"></i></a>
              <span class="date">Sep 17 2011</span>
            </div>
    end .entry-meta 
            <div class="entry-body">
              <a href="post_right_sidebar.jsp">
                <h5 class="title">Amazing video post format</h5>
              </a>
              <p>
                Lorem ipsum dolor sit amet nec, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque.
              </p>
            </div>
       end .entry-body 
            <div class="clear">
            </div>
          </div>
          <div class="span3">
            <div class="post-slider">
     start flexslider   
                   <div class="flexslider">
                <ul class="slides">
                  <li>
                    <a href="post_right_sidebar.jsp"><img src="/comer/resources/assets/img/dummies/work1.jpg" alt=""></a>
                  </li>
                  <li>
                    <a href="post_right_sidebar.jsp"><img src="/comer/resources/assets/img/dummies/work2.jpg" alt=""></a>
                  </li>
                  <li>
                    <a href="post_right_sidebar.jsp"><img src="/comer/resources/assets/img/dummies/work3.jpg" alt=""></a>
                  </li>
                </ul>
              </div>
     end flexslider 
            </div>
            <div class="entry-meta">
              <a href="#"><i class="icon-square icon-48 icon-picture left"></i></a>
              <span class="date">Sep 17 2011</span>
            </div>
  end .entry-meta 
            <div class="entry-body">
              <a href="post_right_sidebar.jsp">
                <h5 class="title">Slider post format with flexslider</h5>
              </a>
              <p>
                Lorem ipsum dolor sit amet nec, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque.
              </p>
            </div>
   end .entry-body 
          </div>
        </div>
      </div> 
      
  
    </div> --> 
  </section>
  
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
