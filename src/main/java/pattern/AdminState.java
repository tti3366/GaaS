package pattern;

public class AdminState implements UserState {

	@Override
	public String getWelcomeMessage() {
		return "환영합니다 관리자님";
	}

}
