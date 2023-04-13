package model;

public class Dept {
	
	private String deptId;
	private String nameKr;
	private String nameEn;
	
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getNameKr() {
		return nameKr;
	}
	public void setNameKr(String nameKr) {
		this.nameKr = nameKr;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	@Override
	public String toString() {
		return "Dept [deptId=" + deptId + ", nameKr=" + nameKr + ", nameEn=" + nameEn + "]";
	}

}
