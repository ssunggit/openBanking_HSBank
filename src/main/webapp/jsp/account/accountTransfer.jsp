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
	<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
 
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
	
	<section>
	<div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container contact px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 contact-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 ps-lg-0">
                    
                        <div class="section-title text-start">
                            <h1 class="display-5 mb-4">계좌이체</h1>
                        </div>
	
						<form action="${ pageContext.request.contextPath }/accountTransferProcess.do" method="post">
						<div class="row g-3">
							 <div class="col-12">
						 		<div class="form-floating">
								<select name="accountNumber" class="form-select border-0" style="height: 55px;">
									<option selected>출금계좌</option>
									<c:forEach items="${ accountList }" var="account" >
										<option value="${ account.accountNumber}" > [${ account.bankName}] ${ account.accountNumber} </option>
									</c:forEach>
								</select>
								</div>
							</div>
							
							<div class="col-md-3">
	                            <div class="form-floating">
								<select name="depositBankCode" class="form-select border-0" style="height: 55px;">
									<option selected>은행명</option>
									<option value="001">jj bank</option>
									<option value="002">jyp bank</option>
									<option value="003">hs bank</option>
									<option value="004">yr bank</option>
								</select>
								</div>
							</div>
							
							<div class="col-md-9">
                            <div class="form-floating">
								<input type="text" name="depositAccountNumber" class="form-control"  placeholder="계좌번호입력" id="subject"> 
								<label for="subject">계좌번호입력</label>
							</div>
							</div>
							
							<div class="col-12">
                            <div class="form-floating">
								<input type="text" name="dealAmount" class="form-control"  placeholder="이체할 금액을 입력하세요."> 
								<label for="subject">이체할 금액을 입력하세요.</label>
							</div>
							</div>
							
							<div class="col-12">
	                            <div class="form-floating">
									<input type="password" name="accountPW" class="form-control"  placeholder="비밀번호를 입력하세요."> 
									<label for="subject">비밀번호를 입력하세요.</label> 
								</div>
							</div>
							<div class="col-12">
								<input type="submit" value="계좌이체" id="click" class="btn btn-primary w-100 py-3" >
								<button id="kakao">kakao</button> 
							</div>
							
							</div>
						</form>
					</div>
                </div>
                <div class="col-lg-6 pe-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <!-- <iframe class="position-absolute w-100 h-100" style="object-fit: cover;"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3001156.4288297426!2d-78.01371936852176!3d42.72876761954724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4ccc4bf0f123a5a9%3A0xddcfc6c1de189567!2sNew%20York%2C%20USA!5e0!3m2!1sen!2sbd!4v1603794290143!5m2!1sen!2sbd"
                        frameborder="0" allowfullscreen="" aria-hidden="false"
                        tabindex="0"></iframe> -->
                        <div id="map" style="width:100%; height:300px;" class="position-absolute w-100 h-100" ></div>
                    </div>
                </div>
            </div>
        </div>
    	</div>
	</section>






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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55b0f3bc1679b402cdeae61679ecd995&libraries=services,clusterer"></script>
      <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = { 
              center: new kakao.maps.LatLng(37.477366, 126.862592), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };
      
      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
      // 마커가 표시될 위치입니다 
      var markerPosition  = new kakao.maps.LatLng(37.477366, 126.862592); 
      
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
          position: markerPosition
      });
      
      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);
      
      // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
      // marker.setMap(null);    
      </script>
    
<script>

	document.addEventListener("DOMContentLoaded",()=>{
 	
	document.getElementById("kakao").style.display="none";
 	
 	
 	click.addEventListener("click",()=>{
 		document.getElementById("kakao").click();
 	});
 	
 	
 	
 });

</script>


<script>


Kakao.init('b1d1dccafb1dae08a9c45d24b18e3dfa'); 
 // 이건 각자 발급받은 키 사용하셔야 합니다!!
Kakao.Share.createDefaultButton({
    container: '#kakao',
    objectType: 'feed',
    content: {
      title: '이체 알림',
      description: '고객님의 계좌로 이체가 되었습니다.' ,
      imageUrl:
        'https://as2.ftcdn.net/v2/jpg/00/72/77/79/1000_F_72777927_1KJdTrKgGjBoiBBHhc4ZmQh3fWNHL1fC.jpg',
      link: {
        mobileWebUrl: 'https://developers.kakao.com',
        androidExecutionParams: 'test',
      },
    },
    itemContent: {
      profileText: 'J_INVESTMENT_BANK',
      profileImageUrl: 'https://as1.ftcdn.net/v2/jpg/03/03/97/14/1000_F_303971411_u9vfK85YmPytzdxTjDSBJWh2lc7fwMsh.jpg',
    },
    social: {
      likeCount: 10,
      commentCount: 20,
      sharedCount: 30,
    },
    buttons: [
      {
        title: '자세히 보기',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
        }
      }
    ]
  });
</script>

</body>
</html>