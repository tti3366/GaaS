package serviceImpl;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ClubDao;
import dao.ClubUsersDao;
import dao.DeptDao;
import dao.UserDao;
import model.Club;
import model.ClubUsers;
import model.Dept;
import model.User;
import service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	DeptDao deptDao;
	
	@Autowired
	ClubDao clubDao;
	
	@Autowired
	ClubUsersDao clubUsersDao;
	
	public Map<String, Object> getAllTables() {
		Map<String, Object> map = new HashMap<>();
		
		map.put("users", userDao.getAllUsers());
		map.put("clubs", clubDao.getAllClubs());
		map.put("depts", deptDao.getAllDeparts());
		return map;
	}

	public int modifyUser(User user) {
		return userDao.modifyUser(user);
	}
	
	public int modifyDept(Dept dept) {
		return deptDao.modifyDept(dept);
	}
	
	public int modifyClub(Club club) {
		// 동아리가 승인되었을 때 게시판 생성 및 동아리장 정보 등록
		if(club.getClubState() == 1) {	
			// 동아리 게시판 존재 유무 (게시판이 존재하지 않을 때 생성)
			if(!clubDao.existsClubBoard(club.getClubId()))
				clubDao.createClubBoard(club.getClubId());

			// CLUB_USERS 테이블에 동아리장 정보 등록
			if(clubUsersDao.checkSignedById(club.getClubId(), club.getManagerId()) == null) {
				ClubUsers cu_manager = new ClubUsers();
				cu_manager.setUserId(Integer.parseInt(club.getManagerId()));
				cu_manager.setClubId(club.getClubId());
				cu_manager.setJoinDate(LocalDateTime.now());
				cu_manager.setAllowState(1);
				cu_manager.setIntroduce(club.getClubName() + " 동아리장 입니다.");
				cu_manager.setClubName(club.getClubName());
				
				clubUsersDao.insertClub(cu_manager);
			}
		}
		
		// 동아리 정보 수정
		return clubDao.modifyClub(club);
	}
	
	public boolean deleteClub(String clubId) {
		boolean exists = clubDao.existsClubUsers(clubId);
		
		if(exists)	// 동아리에 가입된 인원이 한 명이라도 있으면, 동아리 삭제 불가능 
			return false;
		
		else {
			Club club = clubDao.getClubNamesByNum(clubId);
			String managerId = club.getManagerId();
			
			System.out.println("[" + clubId + " 동아리] 게시판 존재 여부 : " + (clubDao.existsClubBoard(clubId) == true ? "O" : "X"));
			
			// 동아리 게시판이 존재하지 않아야 동아리 삭제 가능
			if(!clubDao.existsClubBoard(clubId)) {	
				if(clubDao.deleteClub(clubId) != 0) {
					System.out.println("[" + clubId + " 동아리] 삭제 성공");
					
					// 동아리장 권한 변경 : admin -> user
					userDao.updateUserAuthority(managerId, "user");
					return true;
				}
				else { 
					System.out.println("[" + clubId + " 동아리] 삭제 실패");
					
					return false;
				}
			}
			return false;
		}
	}
}
