package model.comment.vo;

public class CommentVO {
	private int commmentNo;
	private int parentCommmentNo;
	private String content;
	private String writer;
	private String writingDate;
	private int depth;
	private int commentOrder;
	private int boardNo;
	
	public CommentVO() {
	
	}
	
	

	public int getCommmentNo() {
		return commmentNo;
	}



	public void setCommmentNo(int commmentNo) {
		this.commmentNo = commmentNo;
	}



	public int getParentCommmentNo() {
		return parentCommmentNo;
	}



	public void setParentCommmentNo(int parentCommmentNo) {
		this.parentCommmentNo = parentCommmentNo;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getWritingDate() {
		return writingDate;
	}



	public void setWritingDate(String writingDate) {
		this.writingDate = writingDate;
	}



	public int getDepth() {
		return depth;
	}



	public void setDepth(int depth) {
		this.depth = depth;
	}



	public int getCommentOrder() {
		return commentOrder;
	}



	public void setCommentOrder(int commentOrder) {
		this.commentOrder = commentOrder;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	@Override
	public String toString() {
		return "CommentVO [commmentNo=" + commmentNo + ", parentCommmentNo=" + parentCommmentNo + ", content=" + content
				+ ", writer=" + writer + ", writingDate=" + writingDate + ", depth=" + depth + ", commentOrder="
				+ commentOrder + ", boardNo=" + boardNo + "]";
	}




}
