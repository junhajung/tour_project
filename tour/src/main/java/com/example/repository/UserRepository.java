package com.example.repository;


import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.entity.MyUsers;


public interface UserRepository extends MongoRepository<MyUsers, String> {

	// SELECT COUNT(*) FROM USER WHERE USERID=#{USERID}
	  int countByUseridIgnoreCaseContaining(String userid);
	  
	  MyUsers findByUserid(String userid);

	  Boolean existsByUserid(String userid);

//	  Boolean existsByUseremail(String email);
	  
	  int deleteByUserid(String userid);

	     List<MyUsers> findAllBy(PageRequest pageable);

	     int countAllBy();
}