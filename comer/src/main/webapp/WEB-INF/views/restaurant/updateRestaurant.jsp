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

<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/comer/resources/assets/js/jquery.form.min.js"></script>
  <!-- =======================================================
    Theme Name: Serenity
    Theme URL: https://bootstrapmade.com/serenity-bootstrap-corporate-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
  
<style>

table{
border-collapse: separate;
border-spacing: 0 10px;
}
#id{
width:15%;
}
#tel{
align:center;
}

  
</style>
<script type="text/javascript">	
 function submitUpdate(){

 	var form = $('#updateRes')[0];
    var formData = new FormData(form);
    var no =$('#no').val();
    
		$.ajax({
			type:"POST",
			contentType : false,
	        processData : false,
	        headers: {'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')},
			url:"/comer/restaurant/update/no/"+no,
			data:formData, 
			success:function(response){
			 location.href = "/comer/restaurant";
			},
			error:function(request,status,error){
				alert("에러코드: "+request.status);
			}
		});
	}
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
              <p>
                다른 채식인들과 함께 채식 식당을 함께 방문해요 
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
          <h4>식당 등록 </h4>
          
          <form action="" enctype="multipart/form-data" id="updateRes" name="updateRes">    
          <br><br><br>
          	<table>
          		<tr>
	          		<td>
	          		이름
	          		</td>
          			<td >
          			  <input type="text"  id="name" name="name" value="${resDTO.name }">
          			</td>
          		</tr>
          		<tr>
	          		<td >
	          		카테고리
	          		</td>
	          		<td id="category">
	          		<input type="radio" name="category" value="vegan"/>vegan
					<input type="radio"  name="category" value="pesco"/>pesco
					 <input type="radio"  name="category"value="lacto"/>lacto
					 <input type="radio"  name="category" value="ovo"/>ovo
					 <input type="radio" name="category"  value="flexiterian"/>flexiterian
	          		</td>
	          	</tr>	
	          	<tr>
          			<td >
          			 연락처
          			 </td>
          			 <td>
          			 <input type="text"  id="tel" name="tel" value="${resDTO.tel }">
          			</td>
          		</tr>
          		<tr>	
          			<td> 주소지1 / 주소지2 / 주소지3 
          			</td>
          			<td >
          			<input type="text" id="address1" name="address1" value="${resDTO.address1 }">
          			 <input type="text" id="address2" name="address2" value="${resDTO.address2 }">
          			 <input type="text" id="address3" name="address3"value="${resDTO.address3 }">  
          			</td>
          		</tr>
          		<tr>
	          		<td>
	          		내용
	          		</td>
          			<td colspan="2">    			
          			<textarea style="width:100%;"  rows="15" id="content" name="content">
          			${resDTO.content }
          			</textarea>
          			</td>
          		</tr>
          		<tr>
          			<td>
          			작성자
          			</td>
          			<td>
          			 <input type="text" id="id" name="id" value="${memDTO.id }" readonly/>
          			</td>
          		</tr>
          		<tr>
          			<td>
          			파일첨부
          			</td>
          			<td>
          			<input type="file" name="imageFile"/>
          			</td>
          		<tr>
          	</table>
          	
          	<table>
		       	<tr>
		      	 	<td>   	
		      	 	<meta name="_csrf" content="${_csrf.token}">
		      	 	<input type="hidden" id="no" value="${resDTO.no }"/>
			       	 <input type="button" onclick="submitUpdate();" class="btn btn-success" value="작성하기">
			       	</td>
       	 		</tr>
       	
          	</table>
          </form>  
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
