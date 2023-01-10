package com.teamProject.cdcd.dto;

import java.util.Date;
import java.util.Objects;

import org.springframework.stereotype.Component;

public class BoardDto {
    private Integer ask_id; 
    private String  ask_title;
    private String  ask_content;
    private String  mem_id;
    private int     ask_viewpoint;
    private int     ask_comentcnt;
    private Date    ask_date;
    
    
	public Integer getAsk_id() {
		return ask_id;
	}
	public void setAsk_id(Integer ask_id) {
		this.ask_id = ask_id;
	}
	public String getAsk_title() {
		return ask_title;
	}
	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getAsk_viewpoint() {
		return ask_viewpoint;
	}
	public void setAsk_viewpoint(int ask_viewpoint) {
		this.ask_viewpoint = ask_viewpoint;
	}
	public int getAsk_comentcnt() {
		return ask_comentcnt;
	}
	public void setAsk_comentcnt(int ask_comentcnt) {
		this.ask_comentcnt = ask_comentcnt;
	}
	public Date getAsk_date() {
		return ask_date;
	}
	public void setAsk_date(Date ask_date) {
		this.ask_date = ask_date;
	}

	@Override
	public int hashCode() {
		return Objects.hash(ask_id, ask_content, ask_title, mem_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardDto other = (BoardDto) obj;
		return Objects.equals(ask_id, other.ask_id) && Objects.equals(ask_content, other.ask_content)
				&& Objects.equals(ask_title, other.ask_title) && Objects.equals(mem_id, other.mem_id);
	}
	public BoardDto(Integer ask_id, String ask_title, String ask_content, String mem_id, int ask_viewpoint, int ask_comentcnt,
			Date ask_date) {
		super();
		this.ask_id = ask_id;
		this.ask_title = ask_title;
		this.ask_content = ask_content;
		this.mem_id = mem_id;
		this.ask_viewpoint = ask_viewpoint;
		this.ask_comentcnt = ask_comentcnt;
		this.ask_date = ask_date;
	}
	
    public BoardDto(String ask_title, String ask_content, String mem_id) {
		super();
		this.ask_title = ask_title; 
		this.ask_content = ask_content;
		this.mem_id = mem_id;
	}
	public BoardDto() {}
	@Override
	public String toString() {
		return "BoardDto [ask_id=" + ask_id + ", ask_title=" + ask_title + ", ask_content=" + ask_content + ", mem_id=" + mem_id
				+ ", ask_viewpoint=" + ask_viewpoint + ", ask_comentcnt=" + ask_comentcnt + ", ask_date=" + ask_date + "]";
	}
    

    
}