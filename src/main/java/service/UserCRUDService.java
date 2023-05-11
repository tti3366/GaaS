package service;

import model.ChangePwd;
import model.User;

//오라클에 맞게 메소드 파라미터 수정하면 될듯
public interface UserCRUDService {
	
	//회원가입
	public int updateUser(User user);
	public int changePwd(User user, ChangePwd changePwd);
	public int deleteUsers(User user);
	public int updateUserAuthority(User user);
	public int updateUserAuthority(String userId, String authority);
}
