package com.teamProject.cdcd.dto;

import java.util.Objects;

public class BookmarkDto {
	private Integer bm_id;
	private String mem_id;
	private Integer cafe_id;
	
	public BookmarkDto() {}

	public BookmarkDto(String mem_id, Integer cafe_id) {
		this.mem_id = mem_id;
		this.cafe_id = cafe_id;
	}

	public BookmarkDto(Integer bm_id, String mem_id, Integer cafe_id) {
		super();
		this.bm_id = bm_id;
		this.mem_id = mem_id;
		this.cafe_id = cafe_id;
	}

	public Integer getBm_id() {
		return bm_id;
	}

	public void setBm_id(Integer bm_id) {
		this.bm_id = bm_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public Integer getCafe_id() {
		return cafe_id;
	}

	public void setCafe_id(Integer cafe_id) {
		this.cafe_id = cafe_id;
	}

	@Override
	public String toString() {
		return "BookmarkDto [bm_id=" + bm_id + ", mem_id=" + mem_id + ", cafe_id=" + cafe_id + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(bm_id, cafe_id, mem_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookmarkDto other = (BookmarkDto) obj;
		return bm_id == other.bm_id && cafe_id == other.cafe_id && Objects.equals(mem_id, other.mem_id);
	}
	
	
	
}
