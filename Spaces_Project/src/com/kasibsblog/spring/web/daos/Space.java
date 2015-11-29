package com.kasibsblog.spring.web.daos;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;

public class Space {

	private int id;

	@NotNull
	@Size(min = 7, max = 25, message = "Name should be between 7 and 25 characters")
	private String name;

	@NotNull
	@Size(min = 10, max = 100, message = "Street should be between 10 and 100 characters")
	private String street;

	@NotNull
	@Size(min = 5, max = 20, message = "City should be between 5 and 20 characters")
	private String city;

	@Size(min = 2, max = 20, message = "State should be between 2 and 20 characters")
	private String state;

	@NotNull
	@Size(min = 3, max = 60, message = "Country should be between 3 and 60 characters")
	private String country;

	@NotNull
	@Size(min = 10, max = 10, message = "Contact should be 10 digits")
	private String contact;
	
	private User user;

	public Space() {

	}

	public Space(String name, String street, String city, String state, String country, String contact) {
		this.name = name;
		this.street = street;
		this.city = city;
		this.state = state;
		this.country = country;
		this.contact = contact;
	}
		

	public Space(int id, String name, String street, String city, String state, String country, String contact) {
		this.id = id;
		this.name = name;
		this.street = street;
		this.city = city;
		this.state = state;
		this.country = country;
		this.contact = contact;
	}

	public int getId() {
		return id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Override
	public String toString() {
		return "Space [id=" + id + ", name=" + name + ", street=" + street + ", city=" + city + ", state=" + state
				+ ", country=" + country + ", contact=" + contact + "]";
	}

	

}
