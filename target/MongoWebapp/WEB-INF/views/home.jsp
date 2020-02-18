<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns:th="http://www.thymeleaf.org">
	<head>
		<title>Home</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/home.css"/>
	</head>
	<body data-page="${currentPage}">
	  <div class="wrapper">
	  	  <jsp:include page="fragments/navbar.jsp"></jsp:include>
		  <div class="header">
		    <h1>Home</h1>
		    <p>Use this page to view content</p>
		  </div>
		  <div class="page-body"> 
		  	<div class="page-main"> 
		  		<div class="display-container">
		  			<div class="img-box">
			  			<img class="display-img" src="../resources/img/placeholder.svg" alt="Display Img">
			  			<label>Image 1</label>
			  		</div>
			  		<c:forEach items="${contentBoxes}" var="cb">
						<div class="img-box">
			  				<img class="display-img" src="${cb.image_url}" alt="Display Img">
			  				<label>${cb.title}</label>
			  			</div>
					</c:forEach>
		  		</div>
		  	</div>
		  	
		  	<div class="page-aside"> </div>
		  </div>
	  </div>
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/js/script.js"></script>
</html>