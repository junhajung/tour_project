package com.example.security;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.entity.MyUsers;
import com.example.repository.UserRepository;

@Service
public class MyUserDetailsService implements UserDetailsService{

	@Autowired
	UserRepository userR;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		// username을 넘겨서 일치하는 사용자 1명의 정보 받기
		MyUsers user = userR.findByUserid(userid);
		System.out.println(user.toString());
		System.out.println("MyDetail : " + user.getUserpw());

		// admin, user
		// 가져온 권한정보를 문자열 배열로 만들기
		String[] strAuth = {user.getUserauth()};
		
		// 문자열 배열을 Collection<GrantedAuthority> 타입으로 바꾸기
		Collection<GrantedAuthority> auths = AuthorityUtils.createAuthorityList(strAuth);
		
		// 사용자 객체 넘기기 (아이디, 암호, 권한들)
		return new org.springframework.security.core.userdetails.User(user.getUserid(), user.getUserpw(), auths);
	}


}
