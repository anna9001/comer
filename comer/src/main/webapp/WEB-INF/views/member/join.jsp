<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

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
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

  <!-- =======================================================
    Theme Name: Serenity
    Theme URL: https://bootstrapmade.com/serenity-bootstrap-corporate-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->


<style>
table{
margin:auto;
width:60%;
text-align:center;


}

tr{
align:center;
}
td{
padding:3px;

}

.context{
rowspan:2;
border-top: 1px solid #444444;
border-bottom: 1px solid #444444;
padding:5px;
width:100%;
}

#chkbtn{
margin:0;
padding:0px;
border-collapse: collapse; 
border-spacing: 0;
align:left;
flaot:left;
}

.alert{
color:red;
text-align:center;
background-color:none;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-messages.js"></script>
<!-- <script src="path/to/angular.js"></script>
<script src="path/to/angular-messages.js"></script> -->

<script>
  
$(function(){
	$('#checkId').click(function(){
		$.ajax({
			method:'POST',
    		url:'/comer/checkId.action',
    		data:{id:$('#id').val()},
    		success:function(result){
    			$('#resultId')[0].innerHTML = result;
    		}
		})
	});
});


    var myApp = angular.module("myApp",['ngMessages']);
    myApp.controller("myAppCtl",function($scope,$http){
  
   		 
   	    /* 회원가입 버튼 누를 시-필수 조건 입력 확인  */  
   	 	$scope.join=function(){
   			if($scope.myForm.$valid) {
   				$http({
   					method:'GET',
   					url:'/comer/joinMem.action',
   					params:{id:this.id,pw:this.pw,email:this.email,
   						gender:this.gender,age:this.age,vegan:this.vegan,reason:this.reason					
   						}
   				}).then(function success(response){
   					alert("가입이 완료되었습니다.");
   					window.location.href="/comer/login.action";
   					//$location 
   				})		 						
   			};
   			
				
   		}
    }); //컨트롤러
    
   		 //invalid 에러난 곳에 focus
   		 myApp.directive('accessibleForm',function(){
   			 return{
   				restrict:'A',
   			 	link:function(scope,elem){
   			 		elem.on('submit',function(){
   			 			var firstInvalid=elem[0].querySelector('.ng-invalid');
   			 			if(firstInvalid) firstInvalid.focus();
   			 		});
   			 	}		 
   			 };
   		 });
   		 
		//비밀번호 확인 일치 여부 
   	 	myApp.directive('match',function(){
   			return{
   				restrict:'A',
   				require:'ngModel',
   				link:function($scope,$elem,$attrs,ctrl){
   				
   					function matchValidator(value){
	   					$scope.$watch($attrs.match,function(newVal,oldVal){
	   					var strMatch =$scope.$eval($attrs.match)||"";
	   					ctrl.$setValidity('match',value==strMatch);
	   					});
   					return value;
   					}
   				ctrl.$parsers.push(matchValidator);
   				}//link
   			};//return
   		});//match
 
  
function isEmail(asValue) {
  	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	
}
   		

</script>

</head>

<body>
  <header>
	<jsp:include page="../header.jsp" />
  </header>
  <br><br>
 
  <section id="maincontent">
    <div class="container">
     <div class="row">
        <div class="span12">
          <div class="tagline centered">
            <div class="row">
              <div class="span12">
                <div class="tagline_text" >
			 	<form ngNoForm accessible-form action="" method="POST" name="myForm" ng-app="myApp" ng-controller="myAppCtl" novalidate>
			 		<h3 >회 원 가 입</h3><br/>
			 		<table>
			 			<tr class="context">
				 			<td>
				 			필수사항
				 			</td>
			 			</tr>
			 		</table>
			 		<br>
					<table >
						<tr >
							<td>
							아이디
							</td>
							<td class="chkbtn"><input type="text" name="id" ng-model="id" ng-required="true" style="height:40px;" placeholder="아이디" /> 		
							<button type="button" ng-model="checkIdBtn" ng-init="value=no" id="checkId"  class="btn btn-outline-success" ng-value="no">중복확인</button>
							<br><span color:red;text-align:center;>{{result}} </span>
							<div id="resultId" style="color:red;text-align:center;"></div>
							<div class="error" ng-messages="myForm.id.$error" ng-if="myForm.id.$dirty || myform.$submitted">
							<p ng-message="required"  class="alert"> 필수 입력사항입니다.   </p>																						
							</div>
							</td>						
						</tr>
						<tr>
							<td>
							비밀번호
							</td>
							<td>
							<input type="password" name="pw" id="pw" minlength="4"  maxlength="16" ng-model="pw" style="height:40px;" placeholder="비밀번호" ng-required="true"/>
							<div class="error" ng-messages="myForm.pw.$error" ng-if="myForm.pw.$dirty || myform.$submitted">
							<p ng-message="required" class="alert"> 필수 입력사항입니다. </p>
							<p ng-message="minlength"  class="alert"> 최소 4자입니다. </p>
							<p ng-message="maxlength"  class="alert"> 최대16자입니다. </p>
							</div>
							</td>
						</tr>
						<tr>
							<td>
							비밀번호 확인
							</td>
							<td>
							<input type="password" name="pwConfirm" ng-model="pwConfirm" match="pw" style="height:40px;" placeholder="비밀번호 확인" ng-required="true"/>
							<div class="error" ng-messages="myForm.pwConfirm.$error" ng-if="myForm.pwConfirm.$dirty || myform.$submitted">				
							<p ng-message="match" ng-if="!myForm.pwConfirm.$error.required"  class="alert"> 입력한 비밀번호가 일치하지 않습니다. </p>
							</div>							
							</td>
						</tr>
						<tr>
							<td>
							이메일
							</td>
							<td><input type="text" name="email" style="height:40px;" placeholder="이메일" ng-model="email" ng-pattern="/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/" ng-required="true"/>
							</td>
						</tr>
				</table>
				<br>
				<table>
						<tr class="context">
							<td>
							선택사항
							</td>
						</tr>
					</table>
					<br>
					<table>	
						<tr>
							<td>성별</td>
							<td>
							<input type="radio"  ng-model="gender" value="F"/>F &nbsp;&nbsp;
			  				<input type="radio"  ng-model="gender" value="M"/>M
							</td>
						</tr>					
						<tr>
							<td>나이</td>
							<td><input type="text" id="age" style="width:80px;height:40px;" ng-model="age"/>세<br/>
			 				 </td>
						</tr>
						<tr>
						<td>채식 단계</td>
							<td>
								<input type="radio" ng-model="vegan" value="vegan"/>vegan
					  			<input type="radio" ng-model="vegan" value="pesco"/>pesco
					  			<input type="radio" ng-model="vegan" value="lacto"/>lacto
					  			<input type="radio" ng-model="vegan" value="ovo"/>ovo
					  			<input type="radio" ng-model="vegan" value="flexiterian"/>flexiterian
					  		
				  			</td>
						</tr>

						<!-- <tr>
							<td>채식 시작년도</td>
				  			<td><select name="YEAR"  ng-model="YEAR"  id="YEAR" title="년도"  ng-model="year" class="select w80"></select> 
							<option ng-repeat="x in years" value="x.year">{{x.year}}</option>
							</td>
						</tr> -->
						<tr>	
							<td>채식 시작 계기</td>
							<td><input type="text" style="width:450px;height:40px;" ng-model="reason">
							</td>
						</tr>
					</table>
					
					<table>
					<tr>				
					<td>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					  <button type="submit" class="btn btn-outline-success" ng-click="join()" >회원가입</button>			
					</td>
					</tr>
					</table>
					</form>
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