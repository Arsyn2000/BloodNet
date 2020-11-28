package com.taim.conduire.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.taim.conduire.domain.AdminData;
import com.taim.conduire.domain.ClientData;
import com.taim.conduire.repository.AdminDataRepository;
import com.taim.conduire.repository.ClientDataRepository;
import com.taim.conduire.service.AdminDataService;
import com.taim.conduire.service.ClientDataService;

@Service
public class AdminDataServiceImpl implements AdminDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private AdminDataRepository repository;
    
    @Override
    public JpaRepository<AdminData, Integer> getRepository() {
        return repository;
    }

	@Override
	public List<AdminData> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.ASC, "adminId");
	}

	@Override
	public List<AdminData> findByPhoneNumber(String phoneNumber) {
		return repository.findByPhoneNumber(phoneNumber);
	}

	@Override
	public List<AdminData> findByEmailId(String emailId) {
		return repository.findByEmailId(emailId);
	}
	
		
	
}
