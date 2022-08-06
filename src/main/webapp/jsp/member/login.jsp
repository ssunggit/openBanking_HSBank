<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>HS_bank_로그인</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
</head>
<body>
	<header>
	    <!-- Navbar Start -->
	    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
	        <a href="${ pageContext.request.contextPath }/" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
	            <h2 class="m-0 text-primary">HS BANK</h2>
	        </a>
	        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarCollapse">
	            <div class="navbar-nav ms-auto p-4 p-lg-0">
	                <a href="${ pageContext.request.contextPath }/" class="nav-item nav-link active">Home</a>
	              
	                <c:if test="${ not empty loginVO }">
		                <a href="${ pageContext.request.contextPath }/accountOpendForm.do" class="nav-item nav-link">계좌개설</a>
		                <a href="${ pageContext.request.contextPath }/accountListProcess.do" class="nav-item nav-link">조회</a>
		                <a href="${ pageContext.request.contextPath }/accountTransferForm.do" class="nav-item nav-link">이체</a>
	                </c:if>
	         
	                <a href="${ pageContext.request.contextPath }/boardList.do" class="nav-item nav-link">Q&A</a>
	                <a href="${ pageContext.request.contextPath }/teamForm.do" class="nav-item nav-link">team</a>
	            </div>
	            <c:if test="${ empty loginVO }">
	            	<a href="${ pageContext.request.contextPath }/loginForm.do" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">LOGIN<i class="fa fa-arrow-right ms-3"></i></a>
	            </c:if>
	            <c:if test="${ not empty loginVO }">
	            	<a href="${ pageContext.request.contextPath }/logout.do" class="btn btn-primary py-4 px-lg-3 d-none d-lg-block">LOGOUT</a>
	            </c:if>
	        </div>
	    </nav>
	    <!-- Navbar End -->
	</header>

   <!-- Quote Start -->
    <div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container quote px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 ps-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="img/login.jpg" style="object-fit: cover;" alt="">
                    </div>
                </div> 
                <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                        <div class="section-title text-start">
                            <h1 class="display-5 mb-4">로그인</h1>
                        </div>
                        <p class="mb-4 pb-2">
                        아이디와 비밀번호를 입력해주세요
                        </p>
						<form action="${ pageContext.request.contextPath }/loginProcess.do" method="post">
						<div class="row g-3">
					         <div class="col-12">
					             <input type="text" name="id" class="form-control border-0" placeholder="아이디" style="height: 55px;">
					         </div>
					         <div class="col-12">
					             <input type="password" name="password" class="form-control border-0" placeholder="비밀번호" style="height: 55px;">
					         </div>
					         <div class="col-12">
					             <button class="btn btn-primary w-100 py-3" type="submit">로그인</button>
					         </div>						         
                		</div>
						 </form>
						 
						 <form id="form-kakao-login" method="post" action="${ pageContext.request.contextPath }/kakaoLoginProcess.do">
							<input type="hidden" name="email"/>
							<input type="hidden" name="name"/>
							<input type="hidden" name="img"/>
                   		</form>
                		<br>
                		<div class="row g-3">
							<div class="col-12">
							     <button class="btn btn-primary w-100 py-3" onclick="location.href='${ pageContext.request.contextPath }/joinForm.do'">회원가입</button>
							</div>
							
							<div class="col-6">
								<img id="btn-kakao-login"  src="/OpenBanking_HS/img/KakaoTalk_Login.png" style="width:100%; height: 100%"/>
							</div>
							
							<div class="col-6">
								<img id="btn-kakao-login"  src="/OpenBanking_HS/img/Naver_Login.png" style="width:100%; height: 100%"/>
							</div>
						</div>
						
                	</div>
                </div>
            </div>
        </div>
    </div>
    <!-- Quote End -->

	<footer>
	    <!-- Footer Start -->
	    <div class="container-fluid bg-dark text-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
	        <div class="container">
	            <div class="copyright">
	                <div class="row">
	                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
	                        &copy; <a class="border-bottom" href="#">고객센터</a> &nbsp; 4121-0000
	                    </div>
	                    
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- Footer End -->
	</footer>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script defer="defer">
       
       $(function(){

         $("#btn-kakao-login").click(function(event){
            // a태그 기능 실행멈춤.
            event.preventDefault();
            // 카카오 로그인 실행시 오류메시지를 표시하는 경고창을 화면에 보이지 않게 한다.
            $("alert-kakao-login").addClass("d-none");
            // 사용자 키를 전달, 카카오 로그인 서비스 초기화.
            Kakao.init('b1d1dccafb1dae08a9c45d24b18e3dfa'); // 이건 각자 발급받은 키 사용하셔야 합니다!!
            // 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
            Kakao.Auth.login({
               success:function(auth){
                  Kakao.API.request({
                     url: '/v2/user/me',
                     success: function(response){
                        // 사용자 정보를 가져와서 폼에 추가.
                        var account = response.kakao_account;
                        
                        $('#form-kakao-login input[name=email]').val(account.email);
                        $('#form-kakao-login input[name=name]').val(account.profile.nickname);
                        $('#form-kakao-login input[name=img]').val(account.profile.img);
                        // 사용자 정보가 포함된 폼을 서버로 제출한다.
                        document.querySelector('#form-kakao-login').submit();
                     },
                     fail: function(error){
                        // 경고창에 에러메시지 표시
                        $('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
                     }
                  }); // api request
               }, // success 결과.
               fail:function(error){
                  // 경고창에 에러메시지 표시
                  $('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
               }
            }); // 로그인 인증.
         }) // 클릭이벤트
         
      })// 카카오로그인 끝.

    </script>
    
</body>

</html>