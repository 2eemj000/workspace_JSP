package fileupload;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import common.JDBConnect;

public class MyFileDAO extends JDBConnect{ // JDBC를 통해 DB에 연결
	
//	public static void main(String[] args) {
//		MyFileDAO m = new MyFileDAO();
//		MyFileDTO dto = new MyFileDTO();
//		dto.setTitle("Title");
//		dto.setOfile("aa");
//		dto.setSfile("bb");
//		m.insertFile(dto);
//	}
	
	// 새로운 게시물을 입력합니다.
	public int insertFile(MyFileDTO dto) { // 새로운 게시물 입력을 위한 메서드
		PreparedStatement psmt = null;
		int applyResult = 0;
		try {
			String query = "INSERT INTO myfile (title, cate, ofile, sfile) "
						 + "VALUES (?,?,?,?)";
			psmt = getCon().prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getCate());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			applyResult = psmt.executeUpdate(); // 쿼리문을 실행하면 적용된 행의 개수가 정수로 반환 (1이면 성공, 0이면 실패)
		}
		catch (Exception e) {
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
	}
	
	// 파일목록을 반환합니다.
	public List<MyFileDTO> myFileList(){
		List<MyFileDTO> fileList = new Vector<MyFileDTO>();
		
		// 쿼리문 작성
		String query = "SELECT * FROM myfile ORDER BY idx DESC";
		try {
			Statement stmt = getCon().createStatement(); // 쿼리문 생성
			ResultSet rs = stmt.executeQuery(query); // 쿼리 실행
			
			while (rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setCate(rs.getString(3));
				dto.setOfile(rs.getString(4));
				dto.setSfile(rs.getString(5));
				dto.setPostdate(rs.getString(6));
				
				fileList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("SELECT 시 예외 발생");
			e.printStackTrace();
		}
		return fileList;
	} 
	}