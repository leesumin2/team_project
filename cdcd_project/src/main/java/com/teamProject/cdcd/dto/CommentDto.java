package com.teamProject.cdcd.dto;

import java.util.Date;
import java.util.Objects;

public class CommentDto {
	private Integer a_coment_id;
	private Integer ask_id;
	private String a_coment_content;
	private String mem_id;
	private Date a_coment_date;
	private Date a_comment_update;
	
	public CommentDto() {}

	public CommentDto(Integer ask_id, String a_coment_content, String mem_id) {
		super();
		this.ask_id = ask_id;
		this.a_coment_content = a_coment_content;
		this.mem_id = mem_id;
	}
	
	
	
	
	public void setAsk_id(Integer ask_id) {
		this.ask_id = ask_id;
	}


	public Integer getA_coment_id() {
		return a_coment_id;
	}

	public void setA_coment_id(Integer a_coment_id) {
		this.a_coment_id = a_coment_id;
	}

	public String getA_coment_content() {
		return a_coment_content;
	}

	public void setA_coment_content(String a_coment_content) {
		this.a_coment_content = a_coment_content;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public Date getA_coment_date() {
		return a_coment_date;
	}

	public void setA_coment_date(Date a_coment_date) {
		this.a_coment_date = a_coment_date;
	}


	public Integer getAsk_id() {
		return ask_id;
	}
	
	
	public Date getA_comment_update() {
		return a_comment_update;
	}

	public void setA_comment_update(Date a_comment_update) {
		this.a_comment_update = a_comment_update;
	}

	@Override
	public String toString() {
		return "CommentDto [a_coment_id=" + a_coment_id + ", ask_id=" + ask_id + ", a_coment_content=" + a_coment_content + ", mem_id="
				+ mem_id + ", a_coment_date=" + a_coment_date+", a_comment_update="+a_comment_update+ "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(ask_id, a_coment_id, a_coment_content, mem_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentDto other = (CommentDto) obj;
		return Objects.equals(ask_id, other.ask_id) && Objects.equals(a_coment_id, other.a_coment_id)
				&& Objects.equals(a_coment_content, other.a_coment_content) && Objects.equals(mem_id, other.mem_id);
	}

	
	
}
