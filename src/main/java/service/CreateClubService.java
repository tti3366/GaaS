package service;

import model.Club;

public interface CreateClubService {
	//동아리 개설 신청(신청을 하면 관리자가 승인을 해줘야 데이터베이스에 적용이 되는 구조 -> 아직 구현 x)
	public int insertClub(Club club);

}
