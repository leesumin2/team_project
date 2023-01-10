package com.teamProject.cdcd.dto;

import java.util.List;
import java.util.Objects;

public class SearchResultDto {

	private CafeDto cafeDto;
	private List<HashtagDto> hashtagList;
	private List<ReviewDto> reviewList;
	private Integer bookmarkCnt;
	
	public SearchResultDto() {}

	
	
	public SearchResultDto(CafeDto cafeDto) {
		super();
		this.cafeDto = cafeDto;
	}
	
	

	public SearchResultDto(CafeDto cafeDto, List<HashtagDto> hashtagList, List<ReviewDto> reviewList, Integer bookmarkCnt) {
		super();
		this.cafeDto = cafeDto;
		this.hashtagList = hashtagList;
		this.reviewList = reviewList;
		this.bookmarkCnt = bookmarkCnt;
	}



	public CafeDto getCafeDto() {
		return cafeDto;
	}



	public void setCafeDto(CafeDto cafeDto) {
		this.cafeDto = cafeDto;
	}



	public List<HashtagDto> getHashtagList() {
		return hashtagList;
	}



	public void setHashtagList(List<HashtagDto> hashtagList) {
		this.hashtagList = hashtagList;
	}



	public List<ReviewDto> getReviewList() {
		return reviewList;
	}



	public void setReviewList(List<ReviewDto> reviewList) {
		this.reviewList = reviewList;
	}



	public Integer getBookmarkCnt() {
		return bookmarkCnt;
	}



	public void setBookmarkCnt(Integer bookmarkCnt) {
		this.bookmarkCnt = bookmarkCnt;
	}



	


	@Override
	public int hashCode() {
		return Objects.hash(cafeDto);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SearchResultDto other = (SearchResultDto) obj;
		return Objects.equals(cafeDto, other.cafeDto);
	}


	@Override
	public String toString() {
		return "CafeInfoDto [cafeDto=" + cafeDto + ", hashtagList=" + hashtagList
				+ ", reviewList=" + reviewList + ", bookmarkCnt=" + bookmarkCnt + "]";
	}
	
	
		
	
}
