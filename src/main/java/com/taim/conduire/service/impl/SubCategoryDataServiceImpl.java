package com.taim.conduire.service.impl;

import com.taim.conduire.domain.SubCategoryData;
import com.taim.conduire.repository.SubCategoryDataRepository;
import com.taim.conduire.service.SubCategoryDataService;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SubCategoryDataServiceImpl implements SubCategoryDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private SubCategoryDataRepository repository;
    
    @Override
    public JpaRepository<SubCategoryData, Integer> getRepository() {
        return repository;
    }

    @Override
    public SubCategoryData findByName(String name) {
    	return repository.findByName(name);
    }

	@Override
	public List<SubCategoryData> findByStatus(String status) {
		return repository.findByStatus(status);
	}

	@Override
	public List<SubCategoryData> findByCategoryId(Integer categoryId) {
		return repository.findByCategoryId(categoryId);
	}
	
	
}
