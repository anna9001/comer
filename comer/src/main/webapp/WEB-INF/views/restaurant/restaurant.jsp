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
  <link href="/comer/resources/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
  <link href="/comer/resources/assets/css/style.css" rel="stylesheet">
  <link href="/comer/resources/assets/color/default.css" rel="stylesheet">
 
  <!-- fav and touch icons -->
  <link rel="shortcut icon" href="assets/ico/favicon.ico">
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
<!-- <script src="/comer/resources/assets/js/jquery.min.js"></script> -->
 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<link href="/comer/resources/assets/css/boardList.css" rel="stylesheet">
<script src="/comer/resources/js/restaurant.js"></script>
<style type="text/css">

#table1{
width:98%;
border-spacing: 0 10px;
}
#list{
width:100%;
border-collapse: separate;
border-spacing: 0 10px;
}
#name{
width:40%;
font-weight:bold;
font-size:15px;
}
#tel{
width:20%;
font-weight:bold;
font-size:15px;
}  
#subLine{
border-bottom: 1px solid;
border-collapse: separate;
border-spacing: 0 10px;
}

#numF{
width:4%;
font-size:15px;
}
#idF{
width:18%;
font-size:15px;
}
#nameF{
width:40%;
font-size:15px;
}
#telF{
width:20%;
font-size:15px;}


</style>
<script type="text/javascript">
$(document).ready(function(){

	 showList(1,"","");
	 
	 function showList(page,category,address1){
		 
		 service.getList({page:page,category:category,address1:address1},function(list){
			 var str="";
			 var rList = $("#list");

			 if(list==null||list.length==0){		
					str = "<td colspan='5' style='font-weight:bold;font-size:20px;'> 등록된 식당이 없습니다</td>";
					rList.html(str);
					return;
			}
			
			var length = list.length;
			for(var i=0;i<length;i++){
			
				str +="<tr>";
				str +="<td id='numF'> "+list[i].no+"</td>"
				str +="<td id='idF'>[ "+list[i].category+" ]</td>"
				str +="<td id='nameF'><a href='/comer/restaurant/no/"+list[i].no+"'>"+list[i].name+"</a></td>"
				str +="<td id='idF'>[ "+list[i].address1+" ]</td>"
				str +="<td id='telF'>"+list[i].tel+"</td>"
				str +="</tr>";
			}

			rList.html(str);
		 
		}); //getlist
	 } //showlist
	 
	 var option = $("#category option:selected").val();	
	 var address1 = $("#address1 option:selected").val();
	 
	 $('#category').on('change',function(){
		  option = $("#category option:selected").val();
		  showList(1,option,address1);
		}); 
	 
	 $('#address1').on('change',function(){
		 address1 = $("#address1 option:selected").val();
		 showList(1,option,address1);
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
              <h3>채식 식당</h3>
              <p>
              
              </p>
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
    
          <select id="category">
          	<option value="" selected="selected">채식단계</option>
       	   	<option  value="vegan">비건</option>
         	 <option value="fesco">페스코</option>
         	 <option value="ovo">오보</option>    
         	 <option value="flexiterian">플렉시테리안</option>        
          </select>
          
           <select id="address1" >
          	<option value="" selected="selected">지역선택</option>
       	   	<option value="서울">서울특별시</option>
         	 <option value="경기">경기도</option>
         	 <option value="강원">강원도</option>         
          </select>
 	    
          <c:if test="${!empty 'memDTO' }">
            <button style="float:right;"class="btn btn-success" onclick="location.href='/comer/restaurant/writeRestaurant'" >작성하기</button>	
         </c:if>

          <br><br><br>
          	<table id="table1">
          		<tr >
          			<td id="number">
          			 번호
          			</td>
          			<td id="id">
          			카테고리 
          			</td>
          			<td id="name">
          			이름
          			</td>
          			<td id="id">
          			지역
          			</td>
          			<td id="tel">
          			연락처
          			</td> 			
          		</tr> 		
				</table>
		
				<table id="list"></table>				
						
          	<br><br> 
          	      
        </div>
      </div>
    </div>
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
            <a class="brand logo" href="index.html">
							<img src="assets/img/logo-dark.png" alt="" />
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
