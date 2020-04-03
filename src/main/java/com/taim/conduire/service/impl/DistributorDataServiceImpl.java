package com.taim.conduire.service.impl;

import com.taim.conduire.domain.DistributorData;
import com.taim.conduire.repository.DistributorDataRepository;
import com.taim.conduire.service.DistributorDataService;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class DistributorDataServiceImpl implements DistributorDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private DistributorDataRepository repository;
    
    @Override
    public JpaRepository<DistributorData, Integer> getRepository() {
        return repository;
    }

    @Override
    public DistributorData findByName(String name) {
    	return repository.findByName(name);
    }

	@Override
	public List<DistributorData> findByStatus(String status) {
		return repository.findByStatus(status);
	}

	@Override
	public List<DistributorData> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	 private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.ASC, "name");
	 }
	
}
