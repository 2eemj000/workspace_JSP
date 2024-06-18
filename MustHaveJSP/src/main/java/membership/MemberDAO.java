package membership;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.JDBConnect;
public class MemberDAO extends JDBConnect{
	// 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체 생성
	public MemberDAO(String drv,String url,String id,String pw) {
		super(drv,url,id,pw);
	}
	// 명시한 아이디/패스워드와 일치하는 회원 정보를 반환
	public MemberDTO getMemberDTO(String uid,String upass) {
		MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			PreparedStatement psmt = getCon().prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1,uid); // 쿼리문의 첫번째 인파라미터 값 설정
			psmt.setString(2,upass); // 쿼리문의 두번째 인파라미터 값 설정
			ResultSet rs = psmt.executeQuery(); // 쿼리문 실행
			
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
//		finally {
//			try {
//				if (psmt != null) psmt.close();
//				if (rs != null) rs.close();
//			}
//		}
		return dto;
	}
}