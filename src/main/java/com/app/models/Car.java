package com.app.models;

public class Car {
	private String make;
	private String model;
	private String colour;
	private int value;
	
	public Car(String make, String model, String colour, int value) {
		super();
		this.make = make;
		this.model = model;
		this.colour = colour;
		this.value = value;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getColour() {
		return colour;
	}

	public void setColour(String colour) {
		this.colour = colour;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
	
}
