package com.teamProject.cdcd.dto;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class MemberDtoValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberDto.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		System.out.println("UserVaildator.validate() is called");
		MemberDto memberDto = (MemberDto)target;
		
		String id = memberDto.getMem_id();
		String pwd = memberDto.getMem_pwd();
		String pwd_ck = memberDto.getPwd_ck();
		String email = memberDto.getMem_email();
		String phone = memberDto.getMem_phone();
		
		Pattern pattern;
		Matcher matcher;
		
		String emailReg = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		String idReg = "^[a-z0-9]{8,10}$";
		String pwdReg = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,10}$";
		String phoneReg = "^[0-9]{11,}$";
		
		
		// id 검증
		if(id == null || id.isBlank()) {
			errors.rejectValue("mem_id", "required");
		}
		else if(id.length()<8 || id.length()>10) {
			errors.rejectValue("mem_id", "length", new String[] {"8", "10"}, "");
		}
		else {
			pattern = Pattern.compile(idReg);
			matcher = pattern.matcher(id);
			if(!matcher.matches()) {
				errors.rejectValue("mem_id", "invalid");
			}
		}
		
		// pwd 검증
		if(pwd == null || pwd.isBlank()) {
			errors.rejectValue("mem_pwd", "required");
		}
		else if(pwd.length()<8 || pwd.length()>10) {
			errors.rejectValue("mem_pwd", "length", new String[] {"8", "10"}, "");
		}
		else {
			pattern = Pattern.compile(pwdReg);
			matcher = pattern.matcher(pwd);
			if(!matcher.matches()) {
				errors.rejectValue("mem_pwd", "invalid");
			}
		}
		
		// pwd_ck 검증
		if(pwd_ck == null || pwd_ck.isBlank() || !pwd.equals(pwd_ck)) {
			errors.rejectValue("pwd_ck", "pwdNoMatch");
		}

		// email 검증
		if(email == null || email.isBlank()) {
			errors.rejectValue("mem_email", "required");
		}
		else if(email.length()>20) {
			errors.rejectValue("mem_email", "length", new String[] {"20"}, "");
		}
		else {
			pattern = Pattern.compile(emailReg);
			matcher = pattern.matcher(email);
			if(!matcher.matches()) {
				errors.rejectValue("mem_email", "invalid");
			}
		}
		
		// phone 검증
		if(phone.length() == 3) {
			errors.rejectValue("mem_phone", "required");
		}
		else if(phone.length() != 11) {
			errors.rejectValue("mem_phone", "length");
		}
		else {
			pattern = Pattern.compile(phoneReg);
			matcher = pattern.matcher(phone);
			if(!matcher.matches()) {
				errors.rejectValue("mem_phone", "invalid");
			}
		}
		
	}

}
