<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>Collection View</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="../resources/css/collectionView.css"/>
	</head>
	<body data-page="${currentPage}">
		<div class="wrapper">
			<jsp:include page="fragments/navbar.jsp"></jsp:include>
		  	<div class="header">
		  		<h1>Collection View</h1>
		    	<p>View all the documents and collections here<p>
		  	</div>
			<div class="collection-bar" data-colName="${collectionName}">
		  		<div class="collection-select"> 
			  		<select onchange="javascript:handleSelect(this)">
			  		  <option value="" disabled="disabled" selected="selected">Select Collection..</option>
					  <option value="people">People</option>
					  <option value="cars">Cars</option>
					  <option value="hotels">Hotels</option>
					</select>
		  		</div>
			  	<div> 
			  		<h3 class="collectionInfo">
			  			<span id="colName">${collectionName}: </span>
			  			<span id="colSize">${collectionSize}</span>
		  			</h3>
			  	</div>
			  	<div id="addDocDiv"> 
			  		<a id="addDocRef" href="/entrySubmission">New Document</a>
			  	</div>
		  	</div>
			<div id="document-container">
				<c:forEach items="${people}" var="per">
					<div class="document">
						<div class="document-info">
							<p>${per.name}</p>
						</div>
						<div class="icon-container" data-id="${per._id}">
							<div id="select-icon" class="icon">
								<a href="/viewCollections/${collectionName.toLowerCase()}/viewDocument/${per._id}">
									<img class="arrow-img" src="../resources/img/right-arrow.svg" alt="Arrow">
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:forEach items="${cars}" var="car">
					<div class="document">
						<div class="document-info">
							<p>${car.make} ${car.model}</p>
						</div>
						<div class="icon-container" data-id="${car._id}">
							<div id="select-icon" class="icon">
								<a href="/viewCollections/${collectionName.toLowerCase()}/viewDocument/${car._id}">
									<img class="arrow-img" src="../resources/img/right-arrow.svg" alt="Arrow">
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/js/script.js"></script>
</html>