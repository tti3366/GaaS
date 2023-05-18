package model;

import java.util.Date;

public class ClubUser {
	private int userId;
	private String clubId;
	private Date joinDate;
	private int allowState;
	private String introduce;
	
	// JOIN
	private String userName;
	private String userPhoneNumber;
	private String deptNameKr;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getClubId() {
		return clubId;
	}
	public void setClubId(String clubId) {
		this.clubId = clubId;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public int getAllowState() {
		return allowState;
	}
	public void setAllowState(int allowState) {
		this.allowState = allowState;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	public String getDeptNameKr() {
		return deptNameKr;
	}
	public void setDeptNameKr(String deptNameKr) {
		this.deptNameKr = deptNameKr;
	}
	
	@Override
	public String toString() {
		return "ClubUser [userId=" + userId + ", clubId=" + clubId + ", joinDate=" + joinDate + ", allowState="
				+ allowState + ", introduce=" + introduce + ", userName=" + userName + ", userPhoneNumber="
				+ userPhoneNumber + ", deptNameKr=" + deptNameKr + "]";
	}
	
}
