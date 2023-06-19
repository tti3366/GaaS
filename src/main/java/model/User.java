package model;

import pattern.Observer;
import pattern.RegularUserState;
import pattern.UserState;
import service.EmailSender;

public class User implements Observer {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhoneNumber;
	private String authority;
	private String about;
	private UserState state;
	
	public User() {
		state = new RegularUserState();
	}
	
	@Override
	public void update(Reply reply) {
		new EmailSender().emailSend(this, reply);
	}
    public String welcomeMessage() {
        return state.getWelcomeMessage();
    }
	public void setState(UserState state) {
		this.state = state;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail=" + userEmail
				+ ", userPhoneNumber=" + userPhoneNumber + ", authority=" + authority + ", about=" + about + "]";
	}
	
}
