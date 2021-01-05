package dto;

public class CommentDTO {
	private int cNo;
	private int bNo;
	private String content;
	private String cDate;
	private String writer;
	private int cLick; 
	private int cHate;
	public CommentDTO(int cNo, int bNo, String content, String cDate, String writer, int cLick, int cHate) {
		super();
		this.cNo = cNo;
		this.bNo = bNo;
		this.content = content;
		this.cDate = cDate;
		this.writer = writer;
		this.cLick = cLick;
		this.cHate = cHate;
	}
	public CommentDTO(int bNo, String content, String writer) {
		super();
		this.bNo = bNo;
		this.content = content;
		this.writer = writer;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getcLick() {
		return cLick;
	}
	public void setcLick(int cLick) {
		this.cLick = cLick;
	}
	public int getcHate() {
		return cHate;
	}
	public void setcHate(int cHate) {
		this.cHate = cHate;
	}
	@Override
	public String toString() {
		return "CommentDTO [cNo=" + cNo + ", bNo=" + bNo + ", content=" + content + ", cDate=" + cDate + ", writer="
				+ writer + ", cLick=" + cLick + ", cHate=" + cHate + "]";
	}
	
}
