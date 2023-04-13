package model;

public class ChangePwd {
	private String currentPwd;
	private String newPwd;
	private String newPwdCheck;
	
	public String getCurrentPwd() {
		return currentPwd;
	}
	public void setCurrentPwd(String currentPwd) {
		this.currentPwd = currentPwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String getNewPwdCheck() {
		return newPwdCheck;
	}
	public void setNewPwdCheck(String newPwdCheck) {
		this.newPwdCheck = newPwdCheck;
	}

	@Override
	public String toString() {
		return "ChangePwd [currentPwd=" + currentPwd + ", newPwd=" + newPwd + ", newPwdCheck=" + newPwdCheck + "]";
	}
}
