package com.example.repository;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.entity.Naver_guide;

public interface NaverGuideRepository extends MongoRepository<Naver_guide, String>{

	Naver_guide findByTitle(String title);
}
