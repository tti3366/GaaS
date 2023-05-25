package model;

import java.time.LocalDateTime;

public class ClubUsers {
	private int userId;
	private String clubId;
	private LocalDateTime joinDate;
	private String joinDateStr;
	private int allowState;
	private String introduce;
	private String clubName;
  
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
	public LocalDateTime getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(LocalDateTime joinDate) {
		this.joinDate = joinDate;
	}
	public String getJoinDateStr() {
		return joinDateStr;
	}
	public void setJoinDateStr(String joinDateStr) {
		this.joinDateStr = joinDateStr;
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
  public String getClubName() {
    return clubName;
  }
  public void setClubName(String clubName) {
   this.clubName = clubName;
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
