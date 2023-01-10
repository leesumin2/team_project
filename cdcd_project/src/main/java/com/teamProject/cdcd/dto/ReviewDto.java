package com.teamProject.cdcd.dto;

import java.util.Date;
import java.util.Objects;

public class ReviewDto {
	private Integer review_id;
	private Integer cafe_id;
	private String mem_id;
	private String review_content;
	private String review_img1;
	private String review_img2;
	private Integer coffee_score;
	private Integer dessert_score;
	private Integer mood_score;
    private double avg_; 
    private String name;
    private String img;
    private Date r_reg_date;
    
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getAvg_() {
		return avg_;
	}

	public void setAvg_(double avg_) {
		this.avg_ = avg_;
	}
	
	public void setR_reg_date(Date r_reg_date) {
		this.r_reg_date = r_reg_date;
	}
	
	public ReviewDto() {
	}
	
	public Integer getReview_id() {
		return review_id;
	}
	public void setReview_id(Integer review_id) {
		this.review_id = review_id;
	}
	public Integer getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(Integer cafe_id) {
		this.cafe_id = cafe_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_img1() {
		return review_img1;
	}
	public void setReview_img1(String review_img1) {
		this.review_img1 = review_img1;
	}
	public String getReview_img2() {
		return review_img2;
	}
	public void setReview_img2(String review_img2) {
		this.review_img2 = review_img2;
	}
	public Integer getCoffee_score() {
		return coffee_score;
	}
	public void setCoffee_score(Integer coffee_score) {
		this.coffee_score = coffee_score;
	}
	public Integer getDessert_score() {
		return dessert_score;
	}
	public void setDessert_score(Integer dessert_score) {
		this.dessert_score = dessert_score;
	}
	public Integer getMood_score() {
		return mood_score;
	}
	public void setMood_score(Integer mood_score) {
		this.mood_score = mood_score;
	}
	
	public Date getR_reg_date() {
		return r_reg_date;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cafe_id, mem_id, review_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewDto other = (ReviewDto) obj;
		return Objects.equals(cafe_id, other.cafe_id) && Objects.equals(mem_id, other.mem_id)
				&& Objects.equals(review_id, other.review_id);
	}

	@Override
	public String toString() {
		return "ReviewDto [review_id=" + review_id + ", cafe_id=" + cafe_id + ", mem_id=" + mem_id + ", review_content="
				+ review_content + ", review_img1=" + review_img1 + ", review_img2=" + review_img2 + ", coffee_score="
				+ coffee_score + ", dessert_score=" + dessert_score + ", mood_score=" + mood_score+ ", avg_=" + avg_ + ", r_reg_date=" + r_reg_date + "]";
	}

	public ReviewDto(Integer review_id, Integer cafe_id, String mem_id, String review_content, String review_img1,
			String review_img2, Integer coffee_score, Integer dessert_score, Integer mood_score, double avg_, String name,
			String img, Date r_reg_date) {
		super();
		this.review_id = review_id;
		this.cafe_id = cafe_id;
		this.mem_id = mem_id;
		this.review_content = review_content;
		this.review_img1 = review_img1;
		this.review_img2 = review_img2;
		this.coffee_score = coffee_score;
		this.dessert_score = dessert_score;
		this.mood_score = mood_score;
		this.avg_ = avg_;
		this.name = name;
		this.img = img;
		this.r_reg_date = r_reg_date;
	}

	public ReviewDto(String review_content, String review_img1, String review_img2,
			Integer coffee_score, Integer dessert_score, Integer mood_score) {
		super();
		System.out.println("**********" + review_content);
		this.review_content = review_content;
		this.review_img1 = review_img1;
		this.review_img2 = review_img2;
		this.coffee_score = coffee_score;
		this.dessert_score = dessert_score;
		this.mood_score = mood_score;
	}

}