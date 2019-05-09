package com.mywebapp.beans;

public class Book {
	
	private int code;
	private String name;
	private String author;
	private int categoryCode;
	private String category;
	private String description;
	private String image;
	private String pdfUrl;
	private int price;

	public Book() {}
	
	public Book(int code, String name, String author, String image, String pdfUrl) {
		this.code = code;
		this.name = name;
		this.author = author;
		this.image = image;
		this.pdfUrl = pdfUrl;
	}

	public Book(int code, String name, String author, String image, String pdfUrl, int price) {
		this.code = code;
		this.name = name;
		this.author = author;
		this.image = image;
		this.pdfUrl = pdfUrl;
		this.price = price;
	}

	public Book(String name, String author, int categoryCode, String category, String description, String image, String pdfUrl) {
		this.name = name;
		this.author = author;
		this.categoryCode = categoryCode;
		this.category = category;
		this.description = description;
		this.image = image;
		this.pdfUrl = pdfUrl;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPdfUrl() {
		return pdfUrl;
	}

	public void setPdfUrl(String pdfUrl) {
		this.pdfUrl = pdfUrl;
	}

	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getDescripstion() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}

}
