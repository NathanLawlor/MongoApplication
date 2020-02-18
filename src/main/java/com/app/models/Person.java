package com.app.models;

public class Person {
	private String name;
	private int age;
	private String city;
	private String area;

	public Person(String name, int age, String city, String area) {
		super();
		this.name = name;
		this.age = age;
		this.city = city;
		this.area = area;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

}
