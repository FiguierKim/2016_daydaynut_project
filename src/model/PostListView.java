package model;

import java.util.List;

public class PostListView {
	private int messageTotalCount; // 전체 메시지 갯수
	private int currentPageNumber; // 현재 페이지 번호
	private List<Post> messageList; // 보여줄 페이지 내 메시지 리스트
	private int pageTotalCount; // 필요한 전체 페이지 장수
	private int messageCountPerPage; // 페이지당 메시지 수
	private int first;
	private int last;
	
	

	public PostListView() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostListView(int messageTotalCount, int currentPageNumber, List<Post> messageList, int messageCountPerPage,
			int first, int last) {
		super();
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.messageCountPerPage = messageCountPerPage;
		this.first = first;
		this.last = last;

		calculatePageTotalCount(); // 몇 개의 페이지가 필요한지 계산하는 메소드
	}

	private void calculatePageTotalCount() {
		if (messageTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = (messageTotalCount / messageCountPerPage)+1;
			if (messageTotalCount % messageCountPerPage > 0) // 나머지가 존재하면
				pageTotalCount++; // 페이지 하나 더 추가
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

	public List<Post> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Post> messageList) {
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
