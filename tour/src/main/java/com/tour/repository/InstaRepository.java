package com.example.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.entity.Instagram;

public interface InstaRepository  extends MongoRepository<Instagram, String>{

}
