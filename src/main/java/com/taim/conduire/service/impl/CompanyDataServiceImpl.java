package com.taim.conduire.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import com.taim.conduire.domain.CompanyData;
import com.taim.conduire.repository.CompanyDataRepository;
import com.taim.conduire.service.CompanyDataService;

@Service
public class CompanyDataServiceImpl implements CompanyDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private CompanyDataRepository repository;
    
    @Override
    public JpaRepository<CompanyData, Integer> getRepository() {
        return repository;
    }

    @Override
    public CompanyData findByName(String name) {
    	return repository.findByName(name);
    }

	@Override
	public List<CompanyData> findByStatus(String status) {
		return repository.findByStatus(status);
	}

	@Override
	public List<CompanyData> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	 private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.ASC, "name");
	 }
	
}
