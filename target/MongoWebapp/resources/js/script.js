function handleSelect(elm){
	window.location = "/viewCollections/" + elm.value;
}

window.onload = function() {
   if (window.jQuery) {  
       // jQuery is loaded  
   } else {
	   alert("jQuery is not loaded");
   }
   
   let currentPage = $("body").attr("data-page");
  
   document.querySelectorAll(".nav-link").forEach(function(navLink) {
   		var navLinkPage = $(navLink).attr("data-page");
   		
   		if(currentPage === navLinkPage) {
   			$(navLink).addClass("active");
   		}
   		else {
   			$(navLink).removeClass("active");
   		}
   
   });
}

$("#remove-icon").on("click", function() {
	let el = $(this);
	var documentId = $(el[0].parentElement).attr("data-id");
	var collectionName = $(".document-display").attr("data-colName").toLowerCase();

	$.ajax({
	  type: "POST",
	  url: "/removeDocument",
	  data: {documentId: documentId,
	  		 collectionName: collectionName},
	  dataType: "json",
	  complete: function(response) {
		  if(response.status==200) {			  			
			  window.location = "/viewCollections/" + collectionName;
		  }
	  }
	});
});

$("#update-icon").on("click", function() {
	let el = $(this);
	var documentId = $(el[0].parentElement).attr("data-id");
	var collectionName = $(".document-display").attr("data-colName").toLowerCase();

	$.ajax({
	  type: "POST",
	  url: "/updateDocument",
	  data: {documentId: documentId,
	  		 collectionName: collectionName},
	  dataType: "json",
	  complete: function(response) {
		  if(response.status==200) {			  			
			  window.location = "/viewCollections/" + collectionName;
		  }
	  }
	});
});





