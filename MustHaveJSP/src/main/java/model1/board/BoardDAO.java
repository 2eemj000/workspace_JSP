package model1.board;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.mysql.cj.xdevapi.Result;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	//검색 조건에 맞는 게시물의 수를 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; // 결과(게시물 수)를 담을 변수
		//게시물 수를 얻어오는 쿼리문 작성
		String query = "SELECT COUNT(*) FROM BOARD";
		if (map.get("searchWord") != null) {
			query += " WHERE "+ map.get("searchField")+" "
					+" LIKE '%"+ map.get("searchWord")+"%'";
		}
		try {
			Statement stmt = getCon().createStatement(); // 쿼리문 생성
			ResultSet rs = stmt.executeQuery(query); // 쿼리 실행
			rs.next(); // 커서를 첫번째 행으로 이동
			totalCount = rs.getInt(1); // 첫번째 칼럼값을 가져옴
		}
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	//검색 조건에 맞는 게시물 목록을 반환(페이징 기능 지원)
	public List<BoardDTO> selectList(Map<String, Object> map){
		List<BoardDTO> bbs = new Vector<BoardDTO>(); // 결과(게시물 목록)을 담을 변수
		String query = "SELECT * FROM BOARD";
		if (map.get("searchWord") != null) {
			query += " WHERE "+ map.get("searchField")+" "
					+" LIKE '%"+ map.get("searchWord")+"%'";
		}
			query += " ORDER BY num DESC ";
			
			try {
				Statement stmt = getCon().createStatement(); // 쿼리문 생성
				ResultSet rs = stmt.executeQuery(query); // 쿼리 실행
			
				while (rs.next()) { // 결과를 순회하며 한 행(게시물 하나)의 내용을 DTO에 저장
					BoardDTO dto = new BoardDTO(); 
					
					dto.setNum(rs.getString("num")); // 일련번호
					dto.setTitle(rs.getString("title")); // 제목
					dto.setContent(rs.getString("content")); // 내용
					dto.setPostdate(rs.getDate("postdate")); // 작성일
					dto.setId(rs.getString("id")); // 작성자 아이디
					dto.setVisitcount(rs.getString("visitcount")); // 조회수
					
					bbs.add(dto); // 결과목록에 저장
				}
			}
			catch (Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			return bbs;
		}
	// 검색 조건에 맞는 게시물 목록을 반환(페이지 기능 지원)
	public List<BoardDTO> selectListPage(Map<String,Object> map){
		List<BoardDTO> bbs = new Vector<BoardDTO>(); // 결과(게시물목록)을 담을 변수
		// 쿼리문 템플릿
		String query = "select * from board ";
		boolean isSearch = false; // 검색 조건이 있는지 여부를 체크하는 변수
		if (map.get("searchWord")!= null && map.get("searchField") != null) {
			query += " where "+map.get("searchField")
					+" Like '%" +map.get("searchWord") + "%'";
			isSearch = true;
		}
		query += " order by num desc limit ?,?";
		try {
			//쿼리문 완성
			PreparedStatement psmt = getCon().prepareStatement(query);
			if (isSearch) { // 검색 조건이 있을 경우에만 시작 오프셋과 페이지 크기를 설정
	            psmt.setInt(1, (int)map.get("start"));
	            psmt.setInt(2, (int)map.get("pageSize"));
	        } else { // 검색 조건이 없을 경우에는 LIMIT 절에만 바로 설정
	            psmt.setInt(1, (int)map.get("start"));
	            psmt.setInt(2, (int)map.get("pageSize"));
	        }
			//쿼리문 실행
			ResultSet rs = psmt.executeQuery();
			
			while (rs.next()) {
				//한 행(게시물 하나)의 데이터를 DTO에 저장
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				//반환할 결과 목록에 게시물 추가
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		//목록 반환
		return bbs;
	}
	//게시글 데이터를 받아 DB에 추가
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			//insert 쿼리문 작성
			String query = "INSERT INTO BOARD("
					+" num, title, content, id, visitcount)"
					+" VALUES ("
					+" NULL, ?, ?, ?, 0)";
			PreparedStatement psmt = getCon().prepareStatement(query); // 동적쿼리
			psmt.setString(1,dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	//지정된 게시물을 찾아 내용을 반환합니다.
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		//쿼리문 준비
		String query = "SELECT B.*, M.name "
				+ " FROM MEMBER M INNER JOIN BOARD B "
				+ " ON M.ID = B.ID "
				+ " WHERE NUM = ?";
		try {
			PreparedStatement psmt = getCon().prepareStatement(query); // 동적쿼리
			psmt.setString(1,num); // 인파라미터를 일련번호로 설정
			ResultSet rs= psmt.executeQuery(); // 쿼리 실행
			//결과 처리
			if (rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	//지정한 게시물의 조회수를 1 증가시킴
	public void updateVisitCount(String num) {
		//쿼리문 준비
		String query = "UPDATE BOARD SET "
				+ " VISITCOUNT = VISITCOUNT +1"
				+ " WHERE NUM = ?";
		PreparedStatement psmt = null;
		try {
			psmt = getCon().prepareStatement(query); // 동적쿼리
			psmt.setString(1,num); // 인파라미터를 일련번호로 설정
			psmt.executeUpdate(); // 쿼리 실행
		}
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
		finally {
			try {
				psmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	//지정한 게시물 수정
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		try {
			//쿼리문 템플릿
			String query = "UPDATE board SET "
					+" title=?, content=? "
					+" WHERE num=?";
			//쿼리문 완성
			PreparedStatement psmt = getCon().prepareStatement(query);
			psmt.setString(1,dto.getTitle());
			psmt.setString(2,dto.getContent());
			psmt.setString(3,dto.getNum());
			//쿼리문 실행
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result; // 결과반환
	}
	//지정한 게시물 삭제
	public int deletePost(BoardDTO dto) {
		int result = 0;
		try {
			//쿼리문 템플릿
			String query = "DELETE FROM board WHERE num=?";
			
			//쿼리문 완성
			PreparedStatement psmt = getCon().prepareStatement(query);
			psmt.setString(1,dto.getNum());
			
			//쿼리문 실행
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result; // 결과반환
		}
}
