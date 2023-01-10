package com.teamProject.cdcd.dto;

import java.util.Date;
import java.util.Objects;

public class CafeDto {
	private Integer cafe_id;
	private String cafe_name;
	private String cafe_img;
	private String cafe_info;
	private String cafe_num;
	private String cafe_addr1;
	private String cafe_addr2;
	private String cafe_addr3;
	private String cafe_addr4;
	private Date cafe_open;
	private Date cafe_close;
	private Double coffee_avg;
	private Double dessert_avg;
	private Double mood_avg;
	private Double total_avg;
	
	public CafeDto() {}

	public CafeDto(String cafe_name, String cafe_num, String cafe_addr1, String cafe_addr2, String cafe_addr3) {
		super();
		this.cafe_name = cafe_name;
		this.cafe_num = cafe_num;
		this.cafe_addr1 = cafe_addr1;
		this.cafe_addr2 = cafe_addr2;
		this.cafe_addr3 = cafe_addr3;
	}
	
	


	public CafeDto(Integer cafe_id, String cafe_name, String cafe_info, String cafe_num, String cafe_addr1,
			String cafe_addr2, String cafe_addr3, String cafe_addr4) {
		super();
		this.cafe_id = cafe_id;
		this.cafe_name = cafe_name;
		this.cafe_info = cafe_info;
		this.cafe_num = cafe_num;
		this.cafe_addr1 = cafe_addr1;
		this.cafe_addr2 = cafe_addr2;
		this.cafe_addr3 = cafe_addr3;
		this.cafe_addr4 = cafe_addr4;
	}

	public CafeDto(Integer cafe_id, String cafe_name, String cafe_num, String cafe_addr1, String cafe_addr2, String cafe_addr3) {
		super();
		this.cafe_id = cafe_id;
		this.cafe_name = cafe_name;
		this.cafe_num = cafe_num;
		this.cafe_addr1 = cafe_addr1;
		this.cafe_addr2 = cafe_addr2;
		this.cafe_addr3 = cafe_addr3;
	}
	
	


	public CafeDto(Integer cafe_id, String cafe_name, String cafe_num, String cafe_addr1, String cafe_addr2,
			String cafe_addr3, Date cafe_open, Date cafe_close) {
		super();
		this.cafe_id = cafe_id;
		this.cafe_name = cafe_name;
		this.cafe_num = cafe_num;
		this.cafe_addr1 = cafe_addr1;
		this.cafe_addr2 = cafe_addr2;
		this.cafe_addr3 = cafe_addr3;
		this.cafe_open = cafe_open;
		this.cafe_close = cafe_close;
	}

	public CafeDto(String cafe_name, String cafe_img, String cafe_info, String cafe_num, String cafe_addr1,
			String cafe_addr2, String cafe_addr3, String cafe_addr4, Date cafe_open, Date cafe_close) {
		super();
		this.cafe_name = cafe_name;
		this.cafe_img = cafe_img;
		this.cafe_info = cafe_info;
		this.cafe_num = cafe_num;
		this.cafe_addr1 = cafe_addr1;
		this.cafe_addr2 = cafe_addr2;
		this.cafe_addr3 = cafe_addr3;
		this.cafe_addr4 = cafe_addr4;
		this.cafe_open = cafe_open;
		this.cafe_close = cafe_close;
	}

	public CafeDto(Integer cafe_id, String cafe_name, String cafe_img, String cafe_info, String cafe_num,
			String cafe_addr1, String cafe_addr2, String cafe_addr3, String cafe_addr4, Date cafe_open, Date cafe_close) {
		super();
		this.cafe_id = cafe_id;
		this.cafe_name = cafe_name;
		this.cafe_img = cafe_img;
		this.cafe_info = cafe_info;
		this.cafe_num = cafe_num;
		this.cafe_addr1 = cafe_addr1;
		this.cafe_addr2 = cafe_addr2;
		this.cafe_addr3 = cafe_addr3;
		this.cafe_addr4 = cafe_addr4;
		this.cafe_open = cafe_open;
		this.cafe_close = cafe_close;
	}



	public CafeDto(Integer cafe_id, String cafe_name, String cafe_img, String cafe_info, String cafe_num,
			String cafe_addr1, String cafe_addr2, String cafe_addr3, String cafe_addr4, Date cafe_open, Date cafe_close, Double coffee_avg,
			Double dessert_avg, Double mood_avg) {
		super();
		this.cafe_id = cafe_id;
		this.cafe_name = cafe_name;
		this.cafe_img = cafe_img;
		this.cafe_info = cafe_info;
		this.cafe_num = cafe_num;
		this.cafe_addr1 = cafe_addr1;
		this.cafe_addr2 = cafe_addr2;
		this.cafe_addr3 = cafe_addr3;
		this.cafe_addr4 = cafe_addr4;
		this.cafe_open = cafe_open;
		this.cafe_close = cafe_close;
		this.coffee_avg = coffee_avg;
		this.dessert_avg = dessert_avg;
		this.mood_avg = mood_avg;
	}



	public Integer getCafe_id() {
		return cafe_id;
	}

	public void setCafe_id(Integer cafe_id) {
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

	public String getCafe_num() {
		return cafe_num;
	}

	public void setCafe_num(String cafe_num) {
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

	public Date getCafe_open() {
		return cafe_open;
	}

	public void setCafe_open(Date cafe_open) {
		this.cafe_open = cafe_open;
	}

	

	@Override
	public int hashCode() {
		return Objects.hash(cafe_addr1, cafe_addr2, cafe_addr3, cafe_id, cafe_name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CafeDto other = (CafeDto) obj;
		return Objects.equals(cafe_addr1, other.cafe_addr1) && Objects.equals(cafe_addr2, other.cafe_addr2)
				&& Objects.equals(cafe_addr3, other.cafe_addr3) && Objects.equals(cafe_addr4, other.cafe_addr4)
				&& cafe_id == other.cafe_id && Objects.equals(cafe_name, other.cafe_name);
	}

	
	
	public Double getCoffee_avg() {
		return coffee_avg;
	}

	public void setCoffee_avg(Double coffee_avg) {
		this.coffee_avg = coffee_avg;
	}

	public Double getDessert_avg() {
		return dessert_avg;
	}

	public void setDessert_avg(Double dessert_avg) {
		this.dessert_avg = dessert_avg;
	}

	public Double getMood_avg() {
		return mood_avg;
	}

	public void setMood_avg(Double mood_avg) {
		this.mood_avg = mood_avg;
	}






	public Double getTotal_avg() {
		return total_avg;
	}



	public void setTotal_avg(Double total_avg) {
		this.total_avg = total_avg;
	}



	public String getCafe_addr4() {
		return cafe_addr4;
	}



	public void setCafe_addr4(String cafe_addr4) {
		this.cafe_addr4 = cafe_addr4;
	}



	public Date getCafe_close() {
		return cafe_close;
	}



	public void setCafe_close(Date cafe_close) {
		this.cafe_close = cafe_close;
	}



	@Override
	public String toString() {
		return "CafeDto [cafe_id=" + cafe_id + ", cafe_name=" + cafe_name + ", cafe_img=" + cafe_img + ", cafe_info="
				+ cafe_info + ", cafe_num=" + cafe_num + ", cafe_addr1=" + cafe_addr1 + ", cafe_addr2=" + cafe_addr2
				+ ", cafe_addr3=" + cafe_addr3 + ", cafe_addr4=" + cafe_addr4 + ", cafe_open=" + cafe_open
				+ ", cafe_close=" + cafe_close + ", coffee_avg=" + coffee_avg + ", dessert_avg=" + dessert_avg
				+ ", mood_avg=" + mood_avg + ", total_avg=" + total_avg + "]";
	}


	
}
