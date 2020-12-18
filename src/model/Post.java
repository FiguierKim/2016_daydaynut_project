package model;

import java.util.Date;

public class Post {

	private int postId;
	private String saleCategory;
	private String itemCategory;
	private String maker;
	private String password;
	private String title;
	private String itemName;
	private int price;
	private String tradeWay;
	private String phone;
	private String content;
	private Date makeDate;
	private String imageFile;
	
	public Post() {
		super();
	}

	public Post(String saleCategory, String itemCategory,
			String maker, String password, String title, String itemName,
			int price, String tradeWay, String phone, String content,
			Date makeDate, String imageFile) {
		super();
		this.saleCategory = saleCategory;
		this.itemCategory = itemCategory;
		this.maker = maker;
		this.password = password;
		this.title = title;
		this.itemName = itemName;
		this.price = price;
		this.tradeWay = tradeWay;
		this.phone = phone;
		this.content = content;
		this.makeDate = makeDate;
		this.imageFile = imageFile;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getSaleCategory() {
		return saleCategory;
	}

	public void setSaleCategory(String saleCategory) {
		this.saleCategory = saleCategory;
	}

	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTradeWay() {
		return tradeWay;
	}

	public void setTradeWay(String tradeWay) {
		this.tradeWay = tradeWay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getMakeDate() {
		return makeDate;
	}

	public void setMakeDate(Date makeDate) {
		this.makeDate = makeDate;
	}

	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	
}
