package com.teamProject.cdcd.dto;

import java.util.Objects;

public class MemberDto {
	private String mem_id;
	private String mem_pwd;
	private String pwd_ck;
	private String mem_email;
	private String mem_phone;
	
	public MemberDto() {}

	public MemberDto(String mem_id, String mem_pwd, String pwd_ck, String mem_email, String mem_phone) {
		super();
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.pwd_ck = pwd_ck;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
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

	public String getPwd_ck() {
		return pwd_ck;
	}

	public void setPwd_ck(String pwd_ck) {
		this.pwd_ck = pwd_ck;
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
	public String toString() {
		return "MemberDto [mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + ", pwd_ck=" + pwd_ck + ", mem_email="
				+ mem_email + ", mem_phone=" + mem_phone + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(mem_email, mem_id, mem_phone, mem_pwd);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDto other = (MemberDto) obj;
		return Objects.equals(mem_email, other.mem_email) && Objects.equals(mem_id, other.mem_id)
				&& Objects.equals(mem_phone, other.mem_phone) && Objects.equals(mem_pwd, other.mem_pwd);
	}
	
	
}
