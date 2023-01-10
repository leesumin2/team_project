package com.teamProject.cdcd.dto;

import java.util.List;
import java.util.Objects;

public class MenuDto {
	private Integer menu_id;
	private Integer cafe_id;
	private String menu_signature;
	private Integer menu_price;
	
	private List<MenuDto> menuList;
	
	public MenuDto() {}


	public MenuDto(String menu_signature, Integer menu_price) {
		super();
		this.menu_signature = menu_signature;
		this.menu_price = menu_price;
	}

	

	public MenuDto(Integer menu_id, String menu_signature, Integer menu_price) {
		super();
		this.menu_id = menu_id;
		this.menu_signature = menu_signature;
		this.menu_price = menu_price;
	}



	public MenuDto(Integer menu_id, Integer cafe_id, String menu_signature, Integer menu_price) {
		super();
		this.menu_id = menu_id;
		this.cafe_id = cafe_id;
		this.menu_signature = menu_signature;
		this.menu_price = menu_price;
	}

	public Integer getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(Integer menu_id) {
		this.menu_id = menu_id;
	}

	public Integer getCafe_id() {
		return cafe_id;
	}

	public void setCafe_id(Integer cafe_id) {
		this.cafe_id = cafe_id;
	}

	public String getMenu_signature() {
		return menu_signature;
	}

	public void setMenu_signature(String menu_signature) {
		this.menu_signature = menu_signature;
	}

	public Integer getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(Integer menu_price) {
		this.menu_price = menu_price;
	}

	@Override
	public String toString() {
		return "MenuDto [menu_id=" + menu_id + ", cafe_id=" + cafe_id + ", menu_signature=" + menu_signature
				+ ", menu_price=" + menu_price + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cafe_id, menu_id, menu_price, menu_signature);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MenuDto other = (MenuDto) obj;
		return Objects.equals(cafe_id, other.cafe_id) && Objects.equals(menu_id, other.menu_id)
				&& Objects.equals(menu_price, other.menu_price) && Objects.equals(menu_signature, other.menu_signature);
	}



	public List<MenuDto> getMenuList() {
		return menuList;
	}



	public void setMenuList(List<MenuDto> menuList) {
		this.menuList = menuList;
	}
	
	
}
