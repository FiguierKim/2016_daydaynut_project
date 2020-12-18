package model;

import java.util.Date;

public class Trade {
	private int tradeId;
	private String pNo;
	private String seller;
	private String buyer;
	private String item;
	private int price;
	private Date tradeDate;

	public Trade() {
		super();
	}

	public Trade(int tradeId, String pNo, String seller, String buyer,
			String item, int price, Date tradeDate) {
		super();
		this.tradeId = tradeId;
		this.pNo = pNo;
		this.seller = seller;
		this.buyer = buyer;
		this.item = item;
		this.price = price;
		this.tradeDate = tradeDate;
	}

	public int getTradeId() {
		return tradeId;
	}

	public void setTradeId(int tradeId) {
		this.tradeId = tradeId;
	}

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getTradeDate() {
		return tradeDate;
	}

	public void setTradeDate(Date tradeDate) {
		this.tradeDate = tradeDate;
	}

}
