<html>
	<head>
		<title>Entry Submission</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/form.css"/>
	</head>
	<body data-page=${currentPage}>
		<div class="wrapper">
		  <jsp:include page="fragments/navbar.jsp"></jsp:include>
		  <div class="header">
		  	<h1>Entry Submission</h1>
		    <p>Submit a new document using the forms below</p>
		  </div>
		  
		  <div class="form-container">
			  <div id="addPersonForm" class="form">
			    <form method = "post" action = "/submit-document-person">
			   		<fieldset>
						<legend>Add Person</legend>
				       	<label for="nameE">Name:</label> 
				       	<input type = "text" id="nameE" name = "name" value = "" maxlength = "20" placeholder="Name.."/>
			
				    	<label for="ageE">Age:</label>       
				       	<input type = "int" id="ageE" name = "age" value = "" maxlength = "3" placeholder="Age.."/>
			
				       	<label for="cityE">City:</label>  
				       	<input type = "text" id="cityE" name = "city" value = "" maxlength = "50" placeholder="City.."/>
				         
				       	<label for="areaE">Area:</label> 
				       	<input type = "text" id="AreaE" name = "area" value = "" maxlength = "50" placeholder="Area.."/>
				         
				       	<input type = "submit" class="submit-btn" value = "Submit" />
					</fieldset>   
				</form>
			  </div>
			  
			  <div id="addCarForm" class="form">
			    <form method = "post" action = "/submit-document-car">
			   		<fieldset>
						<legend>Add Car</legend>
				       	<label for="makeE">Make:</label> 
				       	<input type = "text" id="makeE" name = "make" value = "" maxlength = "30" placeholder="Make.."/>
			
				    	<label for="modelE">Model:</label>       
				       	<input type = "text" id="modelE" name = "model" value = "" maxlength = "30" placeholder="Model.."/>
			
						<label for="colourE">Colour:</label> 
				       	<input type = "text" id="colourE" name = "colour" value = "" maxlength = "30" placeholder="Colour.."/>
		
				       	<label for="valueE">Value:</label>  
				       	<input type = "int" id="valueE" name = "value" value = "" maxlength = "8" placeholder="Value.."/>
				         
				       	<input type = "submit" class="submit-btn" value = "Submit" />
					</fieldset>   
				</form>
			  </div>
			</div>
			
		</div>
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/js/script.js"></script>
</html>