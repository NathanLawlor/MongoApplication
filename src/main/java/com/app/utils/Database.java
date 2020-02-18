package com.app.utils;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;

public class Database {
	public MongoDatabase getDatabase() {
		final int portNum = 27017;
		final String hostName = "localhost";
		final String dbName = "mongoDefault";

		@SuppressWarnings("resource")
		MongoClient mongoClient = new MongoClient(hostName, portNum);

		return mongoClient.getDatabase(dbName);
	}

}
