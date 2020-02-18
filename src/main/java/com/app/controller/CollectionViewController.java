package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.bson.Document;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.utils.DatabaseCollectionHandler;

@Controller
public class CollectionViewController {

	@GetMapping(value = "/viewCollections")
	public String getCollectionView(Model model, HttpSession session, HttpServletResponse response) {
		
		String lastCol = (String) session.getAttribute("lastCollection");
		
		if(StringUtils.isNotEmpty(lastCol)) {
			response.setHeader("Location", "/viewCollections/" + lastCol);
			response.setStatus(302);
		}
		
		model.addAttribute("collectionName", "N/A");
		model.addAttribute("collectionSize", 0);
		model.addAttribute("currentPage", "viewCollections");
		
		return "collectionView";
	}

	@GetMapping(value = "/viewCollections/{collectionName}")
	public String getCollection(Model model, HttpSession session,
			@PathVariable("collectionName") String colName) {
		DatabaseCollectionHandler colHandler = new DatabaseCollectionHandler();
		
		List<Document> docs = colHandler.retrieveDocuments(colName);
		
		session.setAttribute("lastCollection", colName);

		model.addAttribute("collectionName", StringUtils.capitalize(colName));
		model.addAttribute("collectionSize", docs.size());
		model.addAttribute(colName, docs);

		model.addAttribute("currentPage", "viewCollections");
		
		return "collectionView";
	}
	
	@GetMapping(value = "viewCollections/{collectionName}/viewDocument/{documentId}")
	public String getDocumentView(Model model, HttpSession session,
			@PathVariable("collectionName") String colName,
			@PathVariable("documentId") String docId) {
		colName = colName.toLowerCase();
		DatabaseCollectionHandler colHandler = new DatabaseCollectionHandler();
		
		Document doc = colHandler.getDocument(colName, docId);
		
		session.setAttribute("lastCollection", colName);

		model.addAttribute("collectionName", StringUtils.capitalize(colName));
		model.addAttribute("document", doc);

		model.addAttribute("currentPage", "viewCollections");
		
		return "documentView";
	}

	@PostMapping(value = "/removeDocument")
	public void removeDocument(@RequestParam("documentId") String docId,
			@RequestParam("collectionName") String colName) {
		DatabaseCollectionHandler colHandler = new DatabaseCollectionHandler();
		colHandler.removeDocument(colName, docId);
	}
	
	@PostMapping(value = "/updateDocument")
	public void updateDocument(@RequestParam("documentId") String docId,
			@RequestParam("collectionName") String colName) {
		DatabaseCollectionHandler colHandler = new DatabaseCollectionHandler();
		
		Document doc = colHandler.getDocument(colName, docId);
		colHandler.updateDocument(colName, doc);
	}
}
