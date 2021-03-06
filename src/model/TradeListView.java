package model;

import java.util.List;

public class TradeListView {
	private int messageTotalCount; // ?μ²΄ λ©μμ§?κ°?
	private int currentPageNumber; // ?μ¬ ?μ΄μ§?λ²νΈ
	private List<Trade> messageList; // λ³΄μ¬μ€??μ΄μ§???λ©μμ§?λ¦¬μ€??
	private int pageTotalCount; // ?μ???μ²΄ ?μ΄μ§??₯μ
	private int messageCountPerPage; // ?μ΄μ§?Ή λ©μμ§???
	private int first;
	private int last;
	
	

	public TradeListView() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TradeListView(int messageTotalCount, int currentPageNumber, List<Trade> messageList, int messageCountPerPage,
			int first, int last) {
		super();
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.messageCountPerPage = messageCountPerPage;
		this.first = first;
		this.last = last;

		calculatePageTotalCount(); // λͺ?κ°μ ?μ΄μ§?? ?μ?μ? κ³μ°?λ λ©μ??
	}

	private void calculatePageTotalCount() {
		if (messageTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = (messageTotalCount / messageCountPerPage)+1;
			if (messageTotalCount % messageCountPerPage > 0) // ?λ¨Έμ§?? μ‘΄μ¬?λ©΄
				pageTotalCount++; // ?μ΄μ§??λ ??μΆκ?
		}
	}

	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public void setMessageTotalCount(int messageTotalCount) {
		this.messageTotalCount = messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Trade> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Trade> messageList) {
		this.messageList = messageList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public void setMessageCountPerPage(int messageCountPerPage) {
		this.messageCountPerPage = messageCountPerPage;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	
	

}
