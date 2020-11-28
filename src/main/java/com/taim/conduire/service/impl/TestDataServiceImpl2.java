package com.taim.conduire.service.impl;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import com.taim.conduire.domain.TestData2;
import com.taim.conduire.repository.TestDataRepository2;
import com.taim.conduire.service.TestDataService2;

@Service
public class TestDataServiceImpl2 implements TestDataService2 {
	private static final Logger logger = LogManager.getLogger();

	
	 @Autowired
	    private TestDataRepository2 repository;
    
    @Override
    public JpaRepository<TestData2, Integer> getRepository() {
        return repository;
    }

	@Override
	public List<TestData2> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.ASC, "fullName");
	}

	@Override
	public List<TestData2> findByFullName(String fullName) {
		return repository.findByFullName(fullName);
	}

	@Override
	public List<TestData2> findByEmailAddress(String emailAddress) {
		return repository.findByEmailAddress(emailAddress);
	}
	
}
