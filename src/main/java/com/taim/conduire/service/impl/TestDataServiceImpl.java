package com.taim.conduire.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.taim.conduire.domain.TestData;
import com.taim.conduire.repository.TestDataRepository;
import com.taim.conduire.service.TestDataService;

@Service
public class TestDataServiceImpl implements TestDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private TestDataRepository repository;
    
    @Override
    public JpaRepository<TestData, Integer> getRepository() {
        return repository;
    }

	@Override
	public List<TestData> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.ASC, "name");
	}

	@Override
	public List<TestData> findByFullName(String fullName) {
		return repository.findByFullName(fullName);
	}

	@Override
	public List<TestData> findByEmailAddress(String emailAddress) {
		return repository.findByEmailAddress(emailAddress);
	}
	
}
