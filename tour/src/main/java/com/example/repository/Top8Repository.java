package com.example.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.entity.TOP8;

public interface Top8Repository extends MongoRepository<TOP8, String>{

	TOP8 findByName(String name);

	TOP8 findByRank(String rank);


	
}
