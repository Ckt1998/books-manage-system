package bean;

public class bookBean {
	private String bookId;
	private String bookName;
	private String bookType;
	private String authorName;
	private String bookPrice;
	private String bookIntroduction;
	
	public void setBookId(String id) {
		this.bookId=id;
	}
	public String getBookId() {
		return bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public String getBookType() {
		return bookType;
	}
	public String getAuthorName() {
		return authorName;
	}
	public String getBookPrice() {
		return bookPrice;
	}
	public String getBookIntroduction() {
		return bookIntroduction;
	}

}
