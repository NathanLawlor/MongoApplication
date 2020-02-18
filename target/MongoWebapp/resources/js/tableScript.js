$(document).on("click", ".td", function(event) {
	event.preventDefault();
	
	var el = $(this);
	var innerText = el[0].innerText;
		
	if(el.attr("data-edit") == "false") {
		if(!innerText || 0 === innerText.length) {
			innerText = el.attr("data-text");
		}
		
		$(el).attr('data-text', innerText);
		
		el[0].innerHTML = "<div class='editBox' tabindex='10'>" +
								"<div class='input-div'> " +
									"<input type='text' id='inputFocus' value='"+innerText+"' onfocus='this.select()' tabindex='11'/>" +
								"</div> " +
								"<div class='save-div'>" +
									"<div id='tick-icon' class='icon'> " +
										"<img class='tick-img svg' src='../../../resources/img/tick.svg' alt='Red X'> " +
									"</div> " +
								"</div>" +
						  "</div>"
					
		var editBox1 = document.querySelectorAll(".editBox")[0];
		editBox1.childNodes[0].childNodes[1].focus();
		
		el.addClass("tdFocus");
		el.attr("data-edit", "true");
		
		console.log("show tb");
	}
});

$(document).on("blur", "#inputFocus", function() {
	setTimeout(function(){
		var editBox = document.querySelectorAll(".editBox")[0];
		var tbDiv = editBox.parentElement;
		var input = $(tbDiv).attr("data-text");
        var focus = $(document.activeElement);
        
        if (focus.is(tbDiv) || focus.is(".editBox") || focus.is("#inputFocus")) {
//            console.log("still focused");
        	
        	console.log("keep tb");
        } else {
        	$(tbDiv).removeClass("tdFocus");
        	$(tbDiv).attr("data-edit", "false");
        	tbDiv.innerHTML = input;
        	
        	console.log("hide tb");
        }
    },0);
});

$(document).on("click", "#tick-icon", function(event) {	
	var tbDiv = document.querySelectorAll(".editBox")[0].parentElement;
	var inputValue = document.getElementById("inputFocus").value;
	
	$(tbDiv).attr("data-text", inputValue);
	$(tbDiv).removeClass("tdFocus");
	tbDiv.innerHTML = inputValue;
	
	setTimeout(function(){
		$(tbDiv).attr("data-edit", "false");
	},500);
	
	console.log("hide tb");
});


