package com.taim.conduire.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.taim.conduire.domain.ClientData;
import com.taim.conduire.repository.ClientDataRepository;
import com.taim.conduire.service.ClientDataService;

@Service
public class ClientDataServiceImpl implements ClientDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private ClientDataRepository repository;
    
    @Override
    public JpaRepository<ClientData, Integer> getRepository() {
        return repository;
    }

	@Override
	public List<ClientData> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.ASC, "clientId");
	}
	
	@Override
	public List<ClientData> findByFirstName(String firstName) {
		return repository.findByFirstName(firstName);
	}
	
	@Override
	public List<ClientData> findByLastName(String LastName) {
		return repository.findByLastName(LastName);
	}

	@Override
	public List<ClientData> findByPhoneNumber(String phoneNumber) {
		return repository.findByPhoneNumber(phoneNumber);
	}

	@Override
	public List<ClientData> findByEmailId(String emailId) {
		return repository.findByEmailId(emailId);
	}
	
	@Override
	public List<ClientData> findByBloodGroup(String bloodGroup) {
		return repository.findByBloodGroup(bloodGroup);
	}
	
	@Override
	public List<ClientData> findByBloodDonationCount(Integer bloodDonationCount) {
		return repository.findByBloodDonationCount(bloodDonationCount);
	}
	
	@Override
	public List<ClientData> findBySignUpDate(String signUpDate) {
		return repository.findBySignUpDate(signUpDate);
	}
	
	@Override
	public List<ClientData> findByAadharNumber(String aadharNumber) {
		return repository.findByAadharNumber(aadharNumber);
	}
	
	@Override
	public List<ClientData> findByStatus(String status) {
		return repository.findByStatus(status);
	}
	
	@Override
	public List<ClientData> findByArea(String area) {
		return repository.findByArea(area);
	}
	
}
