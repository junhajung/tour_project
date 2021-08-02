package com.example.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.entity.MyUsers;
import com.example.repository.UserRepository;

@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	UserRepository uRepository;

	@Override
	public int idCheck(String userid) {
		int result = uRepository.countByUserid(userid);
		return result;
	}

	// 회원가입의 경우 가입만 시켜주면 되서 반환값x
	@Override
	public void join(MyUsers user) {
		// 비밀번호 암호화
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		user.setUserpw(pwEncoder.encode(user.getUserpw()));
		System.out.println("JoinService after : " + user.getUserpw());
		uRepository.save(user);

	}

}
