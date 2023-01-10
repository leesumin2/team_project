package com.teamProject.cdcd.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {
	
	private String mem_id;
	private String mem_pwd;
	private String mem_email;
	private String mem_phone;
	public Member() {
		
	}
	public Member(String mem_id, String mem_pwd, String mem_email, String mem_phone) {
		this.mem_id=mem_id;
		this.mem_pwd=mem_pwd;
		this.mem_email=mem_email;
		this.mem_phone=mem_phone;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mem_email == null) ? 0 : mem_email.hashCode());
		result = prime * result + ((mem_id == null) ? 0 : mem_id.hashCode());
		result = prime * result + ((mem_phone == null) ? 0 : mem_phone.hashCode());
		result = prime * result + ((mem_pwd == null) ? 0 : mem_pwd.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		if (mem_email == null) {
			if (other.mem_email != null)
				return false;
		} else if (!mem_email.equals(other.mem_email))
			return false;
		if (mem_id == null) {
			if (other.mem_id != null)
				return false;
		} else if (!mem_id.equals(other.mem_id))
			return false;
		if (mem_phone == null) {
			if (other.mem_phone != null)
				return false;
		} else if (!mem_phone.equals(other.mem_phone))
			return false;
		if (mem_pwd == null) {
			if (other.mem_pwd != null)
				return false;
		} else if (!mem_pwd.equals(other.mem_pwd))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Member [mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + ", mem_email=" + mem_email + ", mem_phone="+ mem_phone + "]";
	}
	
	
}
