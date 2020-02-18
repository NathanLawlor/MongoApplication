<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns:th="http://www.thymeleaf.org">
	<head>
		<title>Document View</title>
		<link rel="stylesheet" type="text/css" href="../../../resources/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="../../../resources/css/documentView.css"/>
	</head>
	<body data-page="${currentPage}">
		<c:set var="colName" scope="session" value="${collectionName}"/>
		<c:set var="doc" scope="session" value="${document}"/>
		
	  	<div class="wrapper">
	  	    <jsp:include page="fragments/navbar.jsp"></jsp:include>
		    <div class="header">
		    	<h1>Document View</h1>
		    	<p>Use this page to view and edit documents</p>
		    </div>
			<div class="document-display" data-colName="${collectionName}">
				<div class="document-table">
				   <h3>Document Contents</h3>
				   <c:choose>
			         <c:when test = "${colName == 'People'}">
				         <div class="tr"> 
				         	<div class="th">
				         		<p>Name:</p>
				         	</div>
				         	<div class="td" data-edit="false" tabindex="0">
				         		<p>${doc.name}</p>
				         	</div>
				         </div>
				         <div class="tr"> 
				         	<div class="th">
				         		<p>Age:</p>
				         	</div>
				         	<div class="td" data-edit="false" tabindex="1">
				         		<p>${doc.age}</p>
				         	</div>
				         </div>
				         <div class="tr"> 
				         	<div class="th">
				         		<p>City:</p>
				         	</div>
				         	<div class="td" data-edit="false" tabindex="2">
				         		<p>${doc.address.city}</p>
				         	</div>
				         </div>
				         <div class="tr"> 
				         	<div class="th">
				         		<p>Area:</p>
				         	</div>
				         	<div class="td" data-edit="false" tabindex="3">
				         		<p>${doc.address.area}</p>
				         	</div>
				         </div>
			         </c:when>
			         
			         <c:when test = "${colName == 'Cars'}">
			         	<div class="tr"> 
				         	<div class="th">
				         		<p>Make:</p>
				         	</div>
				         	<div class="td" data-edit="false" tabindex="0">
				         		<p>${doc.make}</p>
				         	</div>
				         </div>
				         <div class="tr"> 
				         	<div class="th">
				         		<p>Model:</p>
				         	</div>
				         	<div class="td" data-edit="false" tabindex="1">
				         		<p>${doc.model}</p>
				         	</div>
				         </div>
				         <div class="tr"> 
				         	<div class="th">
				         		<p>Colour:</p>
				         	</div>
				         	<div class="td" data-edit="false" tabindex="2">
				         		<p>${doc.colour}</p>
				         	</div>
				         </div>
				         <div class="tr"> 
				         	<div class="th">
				         		<p>Value:</p>
				         	</div>
				         	<div class="td" data-edit="false" tabindex="3">
				         		<p>${doc.value}</p>
				         	</div>
				         </div>
			         </c:when>
		      	   </c:choose>
				</div>
				<div class="icon-container" data-id="${doc._id}">
					<div id="remove-icon" class="icon">
						<img class="redx-img svg" src="../../../resources/img/close.svg" alt="Red X">
						
					</div>
					<div id="update-icon" class="icon">
						<img class="update-img svg" src="../../../resources/img/update-arrow.svg" alt="Update">
					
					</div>
				</div>
			</div>
	  	</div>
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript" src="../../../resources/js/script.js"></script>
	<script type="text/javascript" src="../../../resources/js/tableScript.js"></script>
</html>