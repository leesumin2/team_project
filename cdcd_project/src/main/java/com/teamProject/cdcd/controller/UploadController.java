
package com.teamProject.cdcd.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {

 @ResponseBody  
  @PostMapping("/upload") // ���������� �����ϴ� ���� ��ü 
  public ResponseEntity<String> uploadAjaxPost(MultipartFile uploadFile,MultipartFile uploadFile2, HttpServletRequest request ) {
  
  System.out.println("uploadFile: "+uploadFile); 
  //�ּ�ó��
  //String uploadFolder = "C:\\Users\\green\\Documents\\workspace-sts-3.9.17.RELEASE\\wow\\src\\main\\webapp\\resources\\reviewImg";
  //  �߰� 
  String uploadFolder = "C:/resources/reviewImg/";// ���� ���� ������ ���� ��θ� ���ϱ� 
  System.out.println(uploadFolder+"���ε�����!!!!!!!!!!!!");
  String res ="";
  	  
	  System.out.println("------------------------");
	  UUID uuid = UUID.randomUUID(); 
	  String uploadFileName = "";
	  String uploadFileName2 = "";
	  
		try {	  
			if(!uploadFile.isEmpty()) {
			  uploadFileName = uploadFile.getOriginalFilename();
			  System.out.println("uplodaFileName : "+uploadFileName);  
			  
			  uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); // ��ΰ� �ִٸ� ���� �̸��� ������ �� �ֵ��� 
			  System.out.println("last file name : " + uploadFileName);
			  
			  uploadFileName = uuid.toString()+"_"+uploadFileName;
			  System.out.println("��ȯ �� �����̸� "+uploadFileName);
			  File saveFile = new File(uploadFolder, uploadFileName); //uploadFolder ��ġ�� uploadFileName���� ����
			  uploadFile.transferTo(saveFile); // ���������� �����ϴ� ���� ��ü�� �ڹ� ���� ��ü�� ��ȯ
			  }
			
			if(!uploadFile2.isEmpty()) {
				  uploadFileName2 = uploadFile2.getOriginalFilename();
				  System.out.println("uplodaFileName : "+uploadFileName2);  
				  uploadFileName2 = uploadFileName2.substring(uploadFileName2.lastIndexOf("\\") + 1); // ��ΰ� �ִٸ� ���� �̸��� ������ �� �ֵ��� 
				  System.out.println("last file name : " + uploadFileName2);
				  

				  uploadFileName2 = uuid.toString()+"_"+uploadFileName2;
				  System.out.println("��ȯ �� �����̸� "+uploadFileName2);
				  
				  File saveFile2 = new File(uploadFolder, uploadFileName2); //uploadFolder ��ġ�� uploadFileName���� ����
				  uploadFile2.transferTo(saveFile2); // ���������� �����ϴ� ���� ��ü�� �ڹ� ���� ��ü�� ��ȯ
			}
			  res = uploadFileName+" "+uploadFileName2;
			return new ResponseEntity<String>(res, HttpStatus.OK);
	
		} catch (Exception e) {
			e.getMessage();
			return new ResponseEntity<>("save erro", HttpStatus.BAD_REQUEST);
		}

}
}
