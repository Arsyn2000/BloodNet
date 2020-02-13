package com.taim.conduire.service.impl;

import com.taim.conduire.domain.CategorySubCategoryViewData;
import com.taim.conduire.repository.CategorySubCategoryViewDataRepository;
import com.taim.conduire.service.CategorySubCategoryViewDataService;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class CategorySubCategoryViewDataServiceImpl implements CategorySubCategoryViewDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private CategorySubCategoryViewDataRepository repository;
    
    @Override
    public JpaRepository<CategorySubCategoryViewData, Integer> getRepository() {
        return repository;
    }

    
	
	
}
