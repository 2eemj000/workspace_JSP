package fileupload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil{
	//파일 업로드
	//요청 객체 내에 전송된 파일을 디스크에 저장하고 파일명을 리턴
	public static String uploadFile(HttpServletRequest req, String sDirectory)
			throws ServletException, IOException{ //예외처리
		Part part = req.getPart("ofile"); //request 내장객체의 getPart()메서드로 file타입으로 전송된 폼값받아 Part객체에 저장
		String partHeader = part.getHeader("content-disposition"); //content-disposition 헤더값 읽어옴 (name속성, 파일명 포함된 상태)
		
		//[partHeader=form-data; name="attachedFile"; fileName="파일명.jpg"] 
		String[] phArr = partHeader.split("filename="); //split()으로 분리
		String originalFileName = phArr[1].trim().replace("\"",""); //공백제거, 쌍따옴표도 제거
		
		//전송된 파일이 있다면 디렉터리에 파일저장
		if (!originalFileName.isEmpty()) {
			part.write(sDirectory+File.separator+originalFileName);
		}
		return originalFileName;
	}
	//파일명 변경
	public static String renameFile(String sDirectory, String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date()); //new Date()는 현재시간데이터를 만듦
		String newFileName = now+ext; //파일명과 확장자 연결
		File oldFile = new File(sDirectory+File.separator+fileName); 
		File newFile = new File(sDirectory+File.separator+newFileName);
		oldFile.renameTo(newFile); //원본파일과 새로운파일에 대한 File객체 생성 후 파일명을 변경
		
		//원본 파일명 반환
		return newFileName;
	}
	//multiple 속성 추가로 2개 이상의 파일 업로드
	public static ArrayList<String> multipleFile(HttpServletRequest req, String sDirectory)
			throws ServletException, IOException{
		
		ArrayList<String> listFileName = new ArrayList<>();
		Collection<Part> parts = req.getParts();
		for(Part part : parts) {
			if(!part.getName().equals("ofile"))
				continue;
			String partHeader = part.getHeader("content-disposition");
			String[] phArr = partHeader.split("filename=");
			String originalFileName = phArr[1].trim().replace("\"","");
			if (!originalFileName.isEmpty()) {
				part.write(sDirectory+File.separator +originalFileName);
			}
			listFileName.add(originalFileName);
 		}
		return listFileName;
	}
}