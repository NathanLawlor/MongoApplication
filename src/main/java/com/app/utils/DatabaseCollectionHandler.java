package com.app.utils;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.app.models.Car;
import com.app.models.ContentBox;
import com.app.models.Person;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DatabaseCollectionHandler {

	public List<Document> retrieveDocuments(String colName) {
		MongoCollection<Document> col = DatabaseCollectionHandler.getCollection(colName);

		List<Document> docs = col.find().into(new ArrayList<Document>());
		return docs;
	}

	public void addPerson(Person per) {
		MongoCollection<Document> col = DatabaseCollectionHandler.getCollection("people");

		Document doc = new Document();
		doc.put("name", per.getName());
		doc.put("age", per.getAge());

		Document doc_addr = new Document();
		doc_addr.put("city", per.getCity());
		doc_addr.put("area", per.getArea());

		doc.put("address", doc_addr);

		col.insertOne(doc);
	}

	public void addCar(Car car) {
		MongoCollection<Document> col = DatabaseCollectionHandler.getCollection("cars");

		Document doc = new Document();
		doc.put("make", car.getMake());
		doc.put("model", car.getModel());
		doc.put("colour", car.getColour());
		doc.put("value", car.getValue());

		col.insertOne(doc);
	}
	
	public void addContentBox(ContentBox contentBox) {
		MongoCollection<Document> col = DatabaseCollectionHandler.getCollection("contentBoxes");

		Document doc = new Document();
		doc.put("title", contentBox.getTitle());
		doc.put("description", contentBox.getDescription());
		doc.put("image_url", contentBox.getImgUrl());

		col.insertOne(doc);
	}
	
	public Document getDocument(String colName, String docId) {
		MongoCollection<Document> col = DatabaseCollectionHandler.getCollection(colName);
		
		Document search = new Document();
		search.put("_id", new ObjectId(docId));
		
		Document found = col.find(search).first();
		
		return found;
	}
	
	public void updateDocument(String colName, Document doc) {
		
	}

	public void removeDocument(String colName, String docId) {
		MongoCollection<Document> col = DatabaseCollectionHandler.getCollection(colName);

		Document doc = new Document();
		doc.put("_id", new ObjectId(docId));

		col.deleteOne(doc);

		System.out.println("Removed: " + docId + " from the " + colName + " collection");
	}

	private static MongoCollection<Document> getCollection(String collectionName) {
		Database DB = new Database();
		MongoDatabase mongoDB = DB.getDatabase();
		MongoCollection<Document> collection = mongoDB.getCollection(collectionName);

		return collection;
	}

	@SuppressWarnings("unused")
	private void outputDocuments(MongoCollection<Document> col) {
		FindIterable<Document> itr = col.find();
		MongoCursor<Document> cursor = itr.iterator();
		try {
			while (cursor.hasNext()) {
				System.out.println(cursor.next().toJson());
			}
		} finally {
			cursor.close();
		}
	}
	
}
