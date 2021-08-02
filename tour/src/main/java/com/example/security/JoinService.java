package com.example.security;


import com.example.entity.MyUsers;

public interface JoinService {
	
	//아이디 중복 체크
	public int idCheck(String userid);
	
	//회원 가입
	public void join(MyUsers user);

}
