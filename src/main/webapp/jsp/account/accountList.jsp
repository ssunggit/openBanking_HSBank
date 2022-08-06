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
		                <a href="${ pageContext.request.contextPath }/openBankingForm.do" class="nav-item nav-link">오픈뱅킹</a>
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
	
     <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="section-title text-center">
                <h1 class="display-5 mb-5">계좌리스트</h1>
            </div>
            
	            <div class="row g-4">
	            
		            <div class="section-title">
	                <h4 class="display-6 mb-2"> 🤑 HS BANK</h4>
	            	</div>
	            
			        <c:forEach items="${ accountList }" var="account" varStatus="loop">
			                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
			                    <div class="service-item">
			                        <div class="overflow-hidden">
			                            <img class="img-fluid" src="img/account.jpg" alt="">
			                        </div>
			                        
		            				<form action="${ pageContext.request.contextPath }/accountTransferListForm.do" method="post">
		            					<input type="hidden" value="${ account.accountNumber }" name="accountNumber">
				                        <div class="p-4 text-center border border-5 border-light border-top-0">
				                            <h4 class="mb-3"><c:out value="${ account.accountAlias }"/></h4>
				                            <p><b>은행명: <c:out value="${ account.bankName }"/></b></p>
				                            <p><b>계좌번호 : <c:out value="${ account.accountNumber }"/></b></p>
				                            <p><b>잔액: <c:out value="${ account.balance }"/></b></p>
				               				<button type="submit" class="btn btn-primary w-100 py-3" >거래내역<i class="fa fa-arrow-right ms-2"></i></button>		
				                        </div>
		            				</form>
			                    </div>
			                </div>
		            </c:forEach>
	            </div>
	            
	            <br>
	            <hr>
	            <br>
	            
	            <div class="row g-4">
	            
	            	<div class="section-title">
	                <h4 class="display-6 mb-2"> 🤑 JJ BANK</h4>
	            	</div>
		            
		            <c:forEach items="${ accountList_jj }" var="account" varStatus="loop">
			                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
			                    <div class="service-item">
			                        <div class="overflow-hidden">
			                            <img class="img-fluid" src="img/account.jpg" alt="">
			                        </div>
			                        
		            				<form action="${ pageContext.request.contextPath }/accountTransferListForm.do" method="post">
		            					<input type="hidden" value="${ account.accountNumber }" name="accountNumber">
				                        <div class="p-4 text-center border border-5 border-light border-top-0">
				                            <h4 class="mb-3"><c:out value="${ account.accountAlias }"/></h4>
				                            <p><b>은행명: <c:out value="${ account.bankName }"/></b></p>
				                            <p><b>계좌번호 : <c:out value="${ account.accountNumber }"/></b></p>
				                            <p><b>잔액: <c:out value="${ account.balance }"/></b></p>
				               				<button type="submit" class="btn btn-primary w-100 py-3" >거래내역<i class="fa fa-arrow-right ms-2"></i></button>		
				                        </div>
		            				</form>
			                    </div>
			                </div>
		            </c:forEach>
	            </div>
	            
	            <br>
	            <hr>
	            <br>
	            
	            <div class="row g-4">
	            	<div class="section-title">
	                <h4 class="display-6 mb-2"> 🤑 JYP BANK</h4>
	            	</div>
	            
		            <c:forEach items="${ accountList_jyp }" var="account" varStatus="loop">
			                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
			                    <div class="service-item">
			                        <div class="overflow-hidden">
			                            <img class="img-fluid" src="img/account.jpg" alt="">
			                        </div>
			                        
		            				<form action="${ pageContext.request.contextPath }/accountTransferListForm.do" method="post">
		            					<input type="hidden" value="${ account.accountNumber }" name="accountNumber">
				                        <div class="p-4 text-center border border-5 border-light border-top-0">
				                            <h4 class="mb-3"><c:out value="${ account.accountAlias }"/></h4>
				                            <p><b>은행명: <c:out value="${ account.bankName }"/></b></p>
				                            <p><b>계좌번호 : <c:out value="${ account.accountNumber }"/></b></p>
				                            <p><b>잔액: <c:out value="${ account.balance }"/></b></p>
				               				<button type="submit" class="btn btn-primary w-100 py-3" >거래내역<i class="fa fa-arrow-right ms-2"></i></button>		
				                        </div>
		            				</form>
			                    </div>
			                </div>
		            </c:forEach>
		        </div>
		        
		        <br>
	            <hr>
	            <br>
		        
	            <div class="row g-4">
		            <div class="section-title">
	                <h4 class="display-6 mb-2"> 🤑 YR BANK</h4>
	            	</div>
		            <c:forEach items="${ accountList_yr }" var="account" varStatus="loop">
			                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
			                    <div class="service-item">
			                        <div class="overflow-hidden">
			                            <img class="img-fluid" src="img/account.jpg" alt="">
			                        </div>
			                        
		            				<form action="${ pageContext.request.contextPath }/accountTransferListForm.do" method="post">
		            					<input type="hidden" value="${ account.accountNumber }" name="accountNumber">
				                        <div class="p-4 text-center border border-5 border-light border-top-0">
				                            <h4 class="mb-3"><c:out value="${ account.accountAlias }"/></h4>
				                            <p><b>은행명: <c:out value="${ account.bankName }"/></b></p>
				                            <p><b>계좌번호 : <c:out value="${ account.accountNumber }"/></b></p>
				                            <p><b>잔액: <c:out value="${ account.balance }"/></b></p>
				               				<button type="submit" class="btn btn-primary w-100 py-3" >거래내역<i class="fa fa-arrow-right ms-2"></i></button>		
				                        </div>
		            				</form>
			                    </div>
			                </div>
		            </c:forEach>
		            
	            </div>
	            <br>
	            <hr>
	            <br>
        </div>
    </div>
    <!-- Service End -->

   

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