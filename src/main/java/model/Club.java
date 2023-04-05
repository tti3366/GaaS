package model;

public class Club {
	
	private String clubId;
	private int managerId;
	private String clubName;
	private String division;
	private String deptNameKr;
	private String deptNameEn;
	
	public String getClubId() {
		return clubId;
	}
	public void setClubId(String clubId) {
		this.clubId = clubId;
	}
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
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
	
}
