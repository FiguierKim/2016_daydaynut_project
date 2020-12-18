package model;

import java.util.List;

public class TradeListView {
	private int messageTotalCount; // ?�체 메시�?�?��
	private int currentPageNumber; // ?�재 ?�이�?번호
	private List<Trade> messageList; // 보여�??�이�???메시�?리스??
	private int pageTotalCount; // ?�요???�체 ?�이�??�수
	private int messageCountPerPage; // ?�이�?�� 메시�???
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

		calculatePageTotalCount(); // �?개의 ?�이�?? ?�요?��? 계산?�는 메소??
	}

	private void calculatePageTotalCount() {
		if (messageTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = (messageTotalCount / messageCountPerPage)+1;
			if (messageTotalCount % messageCountPerPage > 0) // ?�머�?? 존재?�면
				pageTotalCount++; // ?�이�??�나 ??추�?
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
