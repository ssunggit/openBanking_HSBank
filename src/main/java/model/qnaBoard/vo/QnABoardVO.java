package model.qnaBoard.vo;

public class QnABoardVO {
	private int no;
	private String title;
	private String content;
	private String writer;
	private String writingTime;
	private String id;
	
	public QnABoardVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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


	public String getWritingTime() {
		return writingTime;
	}

	public void setWritingTime(String writingTime) {
		this.writingTime = writingTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "QnABoardVO [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", writingTime=" + writingTime + ", id=" + id + "]";
	}
	
}
