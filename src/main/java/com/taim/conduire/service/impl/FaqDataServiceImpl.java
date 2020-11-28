package com.taim.conduire.service.impl;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import com.taim.conduire.domain.FaqData;
import com.taim.conduire.repository.FaqDataRepository;
import com.taim.conduire.service.FaqDataService;

@Service
public class FaqDataServiceImpl implements FaqDataService {
	private static final Logger logger = LogManager.getLogger();

	
	 @Autowired
	 private FaqDataRepository repository;
    
    @Override
    public JpaRepository<FaqData, Integer> getRepository() {
        return repository;
    }

	@Override
	public List<FaqData> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.ASC, "id");
	}

	@Override
	public List<FaqData> findByStatus(String status) {
		return repository.findByStatus(status);
	}
}