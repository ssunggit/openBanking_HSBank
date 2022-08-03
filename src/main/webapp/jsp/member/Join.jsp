<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>HS_bank_계좌개설</title>
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
	         
	                <a href="#" class="nav-item nav-link">Q&A</a>
	                <a href="${ pageContext.request.contextPath }/teamForm.do" class="nav-item nav-link">team</a>
	            </div>
	            <c:if test="${ empty loginVO }">
	            	<a href="${ pageContext.request.contextPath }/loginForm.do" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">LOGIN<i class="fa fa-arrow-right ms-3"></i></a>
	            </c:if>
	            <c:if test="${ not empty loginVO }">
	            	<a href="${ pageContext.request.contextPath }/loginout.do" class="btn btn-primary py-4 px-lg-3 d-none d-lg-block">LOGOUT</a>
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
                        <img class="position-absolute img-fluid w-100 h-100" src="img/join.jpg" style="object-fit: cover;" alt="">
                    </div>
                </div> 
                <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                        <div class="section-title text-start">
                            <h1 class="display-5 mb-4">회원가입</h1>
                        </div>
                        <p class="mb-4 pb-2">
                        간편하게 회원가입을 해보세요
                        </p>
						<form action="${ pageContext.request.contextPath }/joinProcess.do" method="post">
						     <div class="row g-3">
						         <div class="col-12">
						             <input  type="text" name="id" class="form-control border-0" placeholder="아이디" style="height: 55px;">
						         </div>
						         <div class="col-12">
						             <input type="password" name="password" class="form-control border-0" placeholder="비밀번호" style="height: 55px;">
						         </div>
						         <div class="col-12">
						             <input type="text" name="name" class="form-control border-0" placeholder="이름" style="height: 55px;">
						         </div>
						         <div class="col-12">
						             <input type="date" name="birth" class="form-control border-0" placeholder="생년월일" style="height: 55px;">
						         </div>
						         <div class="col-12">
						             <input type="tel" name="tel" class="form-control border-0" placeholder="전화번호" style="height: 55px;">
						         </div>
						         <div class="col-12">
						             <input type="email" name="email" class="form-control border-0" placeholder="이메일" style="height: 55px;">
						         </div>
						         <div class="col-12">
						             <input type="text" name="address" class="form-control border-0" placeholder="주소" style="height: 55px;">
						         </div>
						   
						         <div class="col-12">
						             <button class="btn btn-primary w-100 py-3" type="submit">회원가입</button>
						         </div>
						     </div>
						 </form>
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
</body>

</html>