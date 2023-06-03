package model;

import java.sql.Timestamp;

public class Post {
	
	private int postId;//게시물 고유번호-->자동적으로 증가
	private int writerId;//작성자 id(작성자 학번?)-->학번으로 학과를 알 수 있음
	private String clubId;//동아리 코드(99_01)
	private String boardId;//게시판 종류(99_01_qna)
	private String title;//제목
	private String contents;//내용
	private Timestamp postDate;//작성날짜
	private int statusCode;//상태코드(삭제나 수정했을때 알기 위해)'
	
	private int views;//조회수
	private String fileName;//참조 파일 이름(랜덤 숫자+파일 이름)
	
	
	// JOIN
	private String writerName;
	//파일 경로도(파일 이름이 중복될 수 있으니 랜덤 숫자를 앞에 붙여서)
	
	
	//게시물 번호는 숫자로 자동적으로 증가하게
	//동아리,학과,게시판 종류는 따로 컬럼에
	

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getWriterId() {
		return writerId;
	}

	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}

	public String getClubId() {
		return clubId;
	}

	public void setClubId(String clubId) {
		this.clubId = clubId;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getPostDate() {
		return postDate;
	}

	public void setPostDate(Timestamp postDate) {
		this.postDate = postDate;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	@Override
	public String toString() {
		return "Post [postId=" + postId + ", writerId=" + writerId + ", clubId=" + clubId + ", boardId=" + boardId
				+ ", title=" + title + ", contents=" + contents + ", postDate=" + postDate + ", statusCode="
				+ statusCode + ", views=" + views + ", fileName=" + fileName + ", writerName=" + writerName + "]";
	}
}
