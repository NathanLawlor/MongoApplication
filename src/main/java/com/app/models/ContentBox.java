package com.app.models;

public class ContentBox {
	private String title;
	private String description;
	private String imgUrl;
	
	public ContentBox(String title, String description, String imgUrl) {
		super();
		this.title = title;
		this.description = description;
		this.imgUrl = imgUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}
