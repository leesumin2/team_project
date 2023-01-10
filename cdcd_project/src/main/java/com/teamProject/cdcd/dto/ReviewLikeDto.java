package com.teamProject.cdcd.dto;

import java.util.Objects;

public class ReviewLikeDto {
	private Integer like_id;
	private String mem_id;
	private Integer review_id;
	
	public ReviewLikeDto() {}
	public ReviewLikeDto(Integer like_id, String mem_id, Integer review_id) {
		super();
		this.like_id=like_id;
		this.mem_id=mem_id;
		this.review_id=review_id;
	}
	
	public Integer getLike_id() {
		return like_id;
	}
	public void setLike_id(Integer like_id) {
		this.like_id = like_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Integer getReview_id() {
		return review_id;
	}
	public void setReview_id(Integer review_id) {
		this.review_id = review_id;
	}
	@Override
	public int hashCode() {
		return Objects.hash(like_id, mem_id, review_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewLikeDto other = (ReviewLikeDto) obj;
		return Objects.equals(like_id, other.like_id) && Objects.equals(mem_id, other.mem_id)
				&& Objects.equals(review_id, other.review_id);
	}
	@Override
	public String toString() {
		return "ReviewLikeDto [like_id=" + like_id + ", mem_id=" + mem_id + ", review_id=" + review_id + "]";
	}
	
	
}
