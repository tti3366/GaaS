package model;

public class Club {
	
	private String clubId;
	private String managerId;
	private String clubName;
	private String division;
	private String deptNameKr;
	private String deptNameEn;
	private int clubState;
	private String clubInformation;
	
	public String getClubId() {
		return clubId;
	}
	public void setClubId(String clubId) {
		this.clubId = clubId;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getDeptNameKr() {
		return deptNameKr;
	}
	public void setDeptNameKr(String deptNameKr) {
		this.deptNameKr = deptNameKr;
	}
	public String getDeptNameEn() {
		return deptNameEn;
	}
	public void setDeptNameEn(String deptNameEn) {
		this.deptNameEn = deptNameEn;
	}
	public int getClubState() {
		return clubState;
	}
	public void setClubState(int clubState) {
		this.clubState = clubState;
	}
	public String getClubInformation() {
		return clubInformation;
	}
	public void setClubInformation(String clubInformation) {
		this.clubInformation = clubInformation;
	}
	
	@Override
	public String toString() {
		return "Club [clubId=" + clubId + ", managerId=" + managerId + ", clubName=" + clubName + ", division="
				+ division + ", deptNameKr=" + deptNameKr + ", deptNameEn=" + deptNameEn + ", clubState=" + clubState
				+ ", clubInformation=" + clubInformation + "]";
	}
}
