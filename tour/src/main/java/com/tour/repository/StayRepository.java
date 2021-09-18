package com.example.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.entity.Stay;

public interface StayRepository extends MongoRepository<Stay, String>{
	
	
	List<Stay> findByKate(String kate);

	Stay findByName(String name);
	
	List<Stay> findAllByNameIgnoreCaseContaining(String search);
	
	
	int countByNameIgnoreCaseContaining(String kate);

	void deleteByName(String name);

}
