package com.teamProject.cdcd.dto;

import java.util.List;
import java.util.Objects;

public class HashtagDto {
	private Integer cafe_hashtag_id;
	private Integer hashtag_id;
	private Integer cafe_id;
	private String hashtag_content;
	
	private List<HashtagDto> hashtagList;
	
	public HashtagDto() {}
	
	
	

	public HashtagDto(List<HashtagDto> hashtagList) {
		super();
		this.hashtagList = hashtagList;
	}




	public HashtagDto(Integer hashtag_id) {
		super();
		this.hashtag_id = hashtag_id;
	}
	
	public HashtagDto(Integer hashtag_id, Integer cafe_id, String hashtag_content) {
		super();
		this.hashtag_id = hashtag_id;
		this.cafe_id = cafe_id;
		this.hashtag_content = hashtag_content;
	}
	
	

	public HashtagDto(Integer cafe_hashtag_id, Integer hashtag_id, Integer cafe_id, String hashtag_content,
			List<HashtagDto> hashtagList) {
		super();
		this.cafe_hashtag_id = cafe_hashtag_id;
		this.hashtag_id = hashtag_id;
		this.cafe_id = cafe_id;
		this.hashtag_content = hashtag_content;
		this.hashtagList = hashtagList;
	}




	public Integer getHashtag_id() {
		return hashtag_id;
	}

	public void setHashtag_id(Integer hashtag_id) {
		this.hashtag_id = hashtag_id;
	}

	public Integer getCafe_id() {
		return cafe_id;
	}

	public void setCafe_id(Integer cafe_id) {
		this.cafe_id = cafe_id;
	}

	public String getHashtag_content() {
		return hashtag_content;
	}

	public void setHashtag_content(String hashtag_content) {
		this.hashtag_content = hashtag_content;
	}


	@Override
	public String toString() {
		return "HashtagDto [cafe_hashtag_id=" + cafe_hashtag_id + ", hashtag_id=" + hashtag_id + ", cafe_id=" + cafe_id
				+ ", hashtag_content=" + hashtag_content + ", hashtagList=" + hashtagList + "]";
	}




	@Override
	public int hashCode() {
		return Objects.hash(cafe_id, hashtag_content, hashtag_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HashtagDto other = (HashtagDto) obj;
		return Objects.equals(cafe_id, other.cafe_id)
				&& Objects.equals(hashtag_content, other.hashtag_content)
				&& Objects.equals(hashtag_id, other.hashtag_id);
	}




	public List<HashtagDto> getHashtagList() {
		return hashtagList;
	}




	public void setHashtagList(List<HashtagDto> hashtagList) {
		this.hashtagList = hashtagList;
	}




	public Integer getCafe_hashtag_id() {
		return cafe_hashtag_id;
	}




	public void setCafe_hashtag_id(Integer cafe_hashtag_id) {
		this.cafe_hashtag_id = cafe_hashtag_id;
	}


	
	
}
