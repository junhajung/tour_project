package com.example.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.entity.Activity;

public interface ActivityRepository extends MongoRepository<Activity, String>{

	Activity findByName(String name);


}
