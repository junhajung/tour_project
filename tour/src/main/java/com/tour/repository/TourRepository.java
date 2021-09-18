package com.example.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import com.example.entity.Tour;


public interface TourRepository extends MongoRepository<Tour, String> {

	Tour findByName(String name);
	
	List<Tour> findByRegion(String region);

	List<Tour> findAllByNameIgnoreCaseContaining(String search);
	
	List<Tour> findByNameIgnoreCase(String search);

	void deleteByName(String name);

	List<Tour> findByNameLike(String search);








}