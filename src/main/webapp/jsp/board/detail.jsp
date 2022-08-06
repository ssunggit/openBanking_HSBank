<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>HS_BANK</title>
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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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

	<section>
	
	<div class="container">
		<div class="section-title text-center">
        	<h1 class="display-5 mb-5">Q&A</h1>
        </div>
		<table class="table table-borderless table-sm">
		<thead>
		<tr>
			<th scope="row" colspan="5" style="text-align: center;"><font size="5">
			<c:out value="${ board.title }"/></font></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td width="20%"></td>
			<td width="20%"></td>
			<td width="20%"></td>
			<td style="text-align: right;"  width="20%">
			<font size="2">
			<c:out value="${ board.writer }"/>&nbsp;회원님
			</font>
			</td>
			<td style="text-align: right;" width="20%">
			<font size="2">
			<c:out value="${ board.writingTime }"/>
			</font>
			</td>
		</tr>
		<tr>
			<td colspan="5" style="text-align: center;">
			<font size="3">
			<c:out value="${ board.content }"/> 
			</font>
			</td>
		</tr>
		</tbody>
		</table>
		
		<!-- 답변 -->
		<form action="${ pageContext.request.contextPath }/commentProcess.do?no=${ board.no }" method="post">
		<input type="hidden" value="${ loginVO.name }" name="writer">
		<input type="hidden" value="0" name="parentCommmentNo">
		<div class="input-group btn-primary">
	    	<input type="text" class="form-control" placeholder="답변을 등록하세요." 
	    	aria-label="Input group example" aria-describedby="btnGroupAddon" name="content">
	    	<button type="submit" class="input-group-text btn-primary" id="btnGroupAddon">↵</button>
	  	</div>
		</form>
		<br>
		<!-- 답변 리스트 -->
		<c:forEach items="${ commentList }" var="comment" varStatus="loop">
			<div style="margin-left:<c:out value="${40*comment.depth}"/>px">
			<font size="3"><b>
			😀&nbsp;↪ <c:out value="${ comment.writer }"/>&nbsp;회원님  
			</b>
			</font>
				<br>
				<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${ comment.content }"/> 
				</font>
				
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="font-size: 13px;"><c:out value="${ comment.writingDate }"/></span>
				<span class="toggleBtn" style="font-size: 13px;">답글달기</span>
				
				<div class="sub" style="display: none;">
	                <div>
	                   <form action="${ pageContext.request.contextPath }/commentProcess.do?no=${ board.no }" method="post">  
	                      <input type="hidden" name="parentCommmentNo" value="${comment.commmentNo}"> 
	                      <input type="hidden" name="writer" value="${ loginVO.name }"> 
	                      <div class="input-group">
		                      <input type="text" class="form-control" placeholder="답변을 등록하세요." 
		    	aria-label="Input group example" aria-describedby="btnGroupAddon" name="content">
		                      <button type="submit" class="input-group-text btn-primary" id="btnGroupAddon">↵</button>
	                      </div>
	                   </form>
	                </div>
	                
	             </div>
	             
			</div>
		<hr>
		</c:forEach>	
	</div>
	
	</section>
	
	<footer>
	    <!-- Footer Start -->
	    <div class="container-fluid bg-dark text-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
	        <div class="container">
	            <div class="copyright">
	                <div class="row">
	                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
	                        &copy; <a class="border-bottom" href="#">고객센터</a> &nbsp; 1234-9999
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
    
    <script>
     $('.toggleBtn').click(function(){
        $(this).next(".sub").toggle(1000)
     })
</script>
</body>
</body>
</html>