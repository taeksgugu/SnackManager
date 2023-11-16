package com.service.spring.domain;

public class History {
	private Long historyId;
    private String memberId;
    private String snackId;    
    private int count;
    
    public History() {
    	
    }
	public History(String memberId, String snackId, int count) {
		super();
		this.memberId = memberId;
		this.snackId = snackId;
		this.count = count;
	}
	public History(Long historyId, String memberId, String snackId, int count) {
		super();
		this.historyId = historyId;
		this.memberId = memberId;
		this.snackId = snackId;
		this.count = count;
	}
	public Long getHistoryId() {
		return historyId;
	}
	public void setHistoryId(Long historyId) {
		this.historyId = historyId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getSnackId() {
		return snackId;
	}
	public void setSnackId(String snackId) {
		this.snackId = snackId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "History [historyId=" + historyId + ", memberId=" + memberId + ", snackId=" + snackId + ", count="
				+ count + "]";
	}
	
	
}