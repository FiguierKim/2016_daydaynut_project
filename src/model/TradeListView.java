package model;

import java.util.List;

public class TradeListView {
	private int messageTotalCount; // ?„ì²´ ë©”ì‹œì§?ê°?ˆ˜
	private int currentPageNumber; // ?„ì¬ ?˜ì´ì§?ë²ˆí˜¸
	private List<Trade> messageList; // ë³´ì—¬ì¤??˜ì´ì§???ë©”ì‹œì§?ë¦¬ìŠ¤??
	private int pageTotalCount; // ?„ìš”???„ì²´ ?˜ì´ì§??¥ìˆ˜
	private int messageCountPerPage; // ?˜ì´ì§?‹¹ ë©”ì‹œì§???
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

		calculatePageTotalCount(); // ëª?ê°œì˜ ?˜ì´ì§?? ?„ìš”?œì? ê³„ì‚°?˜ëŠ” ë©”ì†Œ??
	}

	private void calculatePageTotalCount() {
		if (messageTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = (messageTotalCount / messageCountPerPage)+1;
			if (messageTotalCount % messageCountPerPage > 0) // ?˜ë¨¸ì§?? ì¡´ì¬?˜ë©´
				pageTotalCount++; // ?˜ì´ì§??˜ë‚˜ ??ì¶”ê?
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
