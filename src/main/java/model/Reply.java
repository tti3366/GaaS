package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import pattern.Observer;
import pattern.Subject;

public class Reply implements Subject {
	
	private List<Observer> observers;
	private int replyId;
	private int writerId;
	private int postId;
	private String contents;
	private Timestamp replyDate;
	private int statusCode;
	// JOIN
	private String writerName;
	
	public Reply() {
		this.observers = new ArrayList<>();
	}
	
	@Override
	public void addObserver(Observer observer) {
		observers.add(observer);
	}
	
    @Override
    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }
    
    @Override
    public void notifyObservers() {
        for (Observer observer : observers) {
            observer.update(this);
        }
    }
    
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getWriterId() {
		return writerId;
	}
	public void setWriterId(int writerId) {
		this.writerId = writerId;
		notifyObservers();
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public List<Observer> getObservers() {
		return observers;
	}
	public void setObservers(List<Observer> observers) {
		this.observers = observers;
	}
	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", writerId=" + writerId + ", postId=" + postId + ", contents=" + contents
				+ ", replyDate=" + replyDate + ", statusCode=" + statusCode + ", writerName=" + writerName + "]";
	}
}