package com.example.repository;


import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.entity.Reply;

import net.bytebuddy.asm.Advice.OffsetMapping.Sort;

import com.example.entity.MyUsers;


public interface ReplyRepository extends MongoRepository<Reply, String> {

	// SELECT COUNT(*) FROM USER WHERE USERID=#{USERID}
	  int countByUseridIgnoreCaseContaining(String userid);
	  
	  int countByName(String name);
	  
	  int countByUserid(String id);

	  Boolean existsByUserid(String userid);

//	  List<Reply> findByName(String name, org.springframework.data.domain.Sort sort);
	  
	  List<Reply> findByUserid(String userid);
	// 일괄 삭제
	int deleteAllByIdIn(String[] id);
	
	// 일괄 select
	List<Reply> findAllById(String[] id);

	List<Reply> findByUserid(String id, PageRequest pageable);

	Reply findByid(String id);

	List<Reply> findByNameOrderByCreatedDateDesc(String name);

	List<Reply> findByUseridOrderByCreatedDateDesc(String id, PageRequest pageable);


}