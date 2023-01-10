package com.teamProject.cdcd.dto;

import java.sql.Time;
import java.util.Objects;
import java.sql.Time;

public class Cafe {
	   private int cafe_id;
	   private String cafe_name;
	   private String cafe_img;
	   private String cafe_info;
	   private int cafe_num;
	   private String cafe_addr1;
	   private String cafe_addr2;
	   private String cafe_addr3;
	   private Time cafe_open;
	
	public Cafe() {}
	
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public String getCafe_img() {
		return cafe_img;
	}
	public void setCafe_img(String cafe_img) {
		this.cafe_img = cafe_img;
	}
	public String getCafe_info() {
		return cafe_info;
	}
	public void setCafe_info(String cafe_info) {
		this.cafe_info = cafe_info;
	}
	public int getCafe_num() {
		return cafe_num;
	}
	public void setCafe_num(int cafe_num) {
		this.cafe_num = cafe_num;
	}
	public String getCafe_addr1() {
		return cafe_addr1;
	}
	public void setCafe_addr1(String cafe_addr1) {
		this.cafe_addr1 = cafe_addr1;
	}
	public String getCafe_addr2() {
		return cafe_addr2;
	}
	public void setCafe_addr2(String cafe_addr2) {
		this.cafe_addr2 = cafe_addr2;
	}
	public String getCafe_addr3() {
		return cafe_addr3;
	}
	public void setCafe_addr3(String cafe_addr3) {
		this.cafe_addr3 = cafe_addr3;
	}
	public Time getCafe_open() {
		return cafe_open;
	}
	public void setCafe_open(Time cafe_open) {
		this.cafe_open = cafe_open;
	}
	
	
	@Override
	public String toString() {
		return "Cafe [cafe_id=" + cafe_id + ", cafe_name=" + cafe_name + ", cafe_img=" + cafe_img + ", cafe_info="
				+ cafe_info + ", cafe_num=" + cafe_num + ", cafe_addr1=" + cafe_addr1 + ", cafe_addr2=" + cafe_addr2
				+ ", cafe_addr3=" + cafe_addr3 + ", cafe_open=" + cafe_open + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(cafe_addr1, cafe_addr2, cafe_addr3, cafe_id, cafe_img, cafe_info, cafe_name, cafe_num,
				cafe_open);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cafe other = (Cafe) obj;
		return Objects.equals(cafe_addr1, other.cafe_addr1) && Objects.equals(cafe_addr2, other.cafe_addr2)
				&& Objects.equals(cafe_addr3, other.cafe_addr3) && cafe_id == other.cafe_id
				&& Objects.equals(cafe_img, other.cafe_img) && Objects.equals(cafe_info, other.cafe_info)
				&& Objects.equals(cafe_name, other.cafe_name) && cafe_num == other.cafe_num
				&& Objects.equals(cafe_open, other.cafe_open);
	}
	   
	   
}
