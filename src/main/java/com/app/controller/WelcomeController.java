package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.bson.Document;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.models.Car;
import com.app.models.Person;
import com.app.utils.DatabaseCollectionHandler;

@Controller
public class WelcomeController {

	@GetMapping(value = { "/", "/home" })
	public String getHome(Model model) {
		DatabaseCollectionHandler colHandler = new DatabaseCollectionHandler();

//		ContentBox cb = new ContentBox("Chevrolet Camaro", "Yellow & Black", "../resources/img/camaro.png");
//		colHandler.addContentBox(cb);
		
		List<Document> docs = colHandler.retrieveDocuments("contentBoxes");
		model.addAttribute("contentBoxes", docs);
		
		model.addAttribute("currentPage", "home");
		
		return "home";
	}

	@GetMapping(value = "/entrySubmission")
	public String getEntryView(Model model) {
		model.addAttribute("currentPage", "entrySubmission");
		return "form";
	}

	@PostMapping("/submit-document-person")
	public void savePersonDocument(HttpServletResponse response,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "age", required = true) int age,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "area", required = false) String area) {
		DatabaseCollectionHandler colHandler = new DatabaseCollectionHandler();

		Person person = new Person(name, age, city, area);

		colHandler.addPerson(person);

		response.setHeader("Location", "/viewCollections");
		response.setStatus(302);
	}
	
	@PostMapping("/submit-document-car")
	public void saveCarDocument(HttpServletResponse response,
			@RequestParam(value = "make", required = true) String make,
			@RequestParam(value = "model", required = true) String model,
			@RequestParam(value = "colour", required = true) String colour,
			@RequestParam(value = "value", required = false) int value) {
		DatabaseCollectionHandler colHandler = new DatabaseCollectionHandler();

		Car car = new Car(make, model, colour, value);

		colHandler.addCar(car);

		response.setHeader("Location", "/viewCollections");
		response.setStatus(302);
	}

}
