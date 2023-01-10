package com.teamProject.cdcd.dto;

import java.util.Objects;

public class Wondoo {
	private String coffeebean_name;
	private String coffeebean_img;
	private String coffeebean_info;
	public Wondoo() {}
	public Wondoo(String coffeebean_name, String coffeebean_img, String coffeebean_info) {
		super();
		this.coffeebean_name=coffeebean_name;
		this.coffeebean_img=coffeebean_img;
		this.coffeebean_info=coffeebean_info;
	}
	public String getCoffeebean_name() {
		return coffeebean_name;
	}
	
	public void setCoffeebean_name(String coffeebean_name) {
		this.coffeebean_name = coffeebean_name;
	}
	public String getCoffeebean_img() {
		return coffeebean_img;
	}
	public void setCoffeebean_img(String coffeebean_img) {
		this.coffeebean_img = coffeebean_img;
	}
	public String getCoffeebean_info() {
		return coffeebean_info;
	}
	public void setCoffeebean_info(String coffeebean_info) {
		this.coffeebean_info = coffeebean_info;
	}
	@Override
	public int hashCode() {
		return Objects.hash(coffeebean_img, coffeebean_info, coffeebean_name);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Wondoo other = (Wondoo) obj;
		return Objects.equals(coffeebean_img, other.coffeebean_img)
				&& Objects.equals(coffeebean_info, other.coffeebean_info)
				&& Objects.equals(coffeebean_name, other.coffeebean_name);
	}
	@Override
	public String toString() {
		return "wondoo [coffeebean_name=" + coffeebean_name + ", coffeebean_img=" + coffeebean_img
				+ ", coffeebean_info=" + coffeebean_info + "]";
	}
	
}
