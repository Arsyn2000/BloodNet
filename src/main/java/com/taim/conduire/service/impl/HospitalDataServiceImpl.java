package com.taim.conduire.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.taim.conduire.domain.HospitalData;
import com.taim.conduire.repository.HospitalDataRepository;
import com.taim.conduire.service.HospitalDataService;

@Service
public class HospitalDataServiceImpl implements HospitalDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private HospitalDataRepository repository;
    
    @Override
    public JpaRepository<HospitalData, Integer> getRepository() {
        return repository;
    }

	@Override
	public List<HospitalData> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.ASC, "hospitalId");
	}

	@Override
	public List<HospitalData> findByName(String name) {
		return repository.findByName(name);
	}

	@Override
	public List<HospitalData> findByEmailId(String emailId) {
		return repository.findByEmailId(emailId);
	}
	
	@Override
	public List<HospitalData> findByPhoneNumber(String phoneNumber) {
		return repository.findByPhoneNumber(phoneNumber);
	}
	
	@Override
	public List<HospitalData> findByQtyA(Float flag) {
		return repository.findByQtyA(flag);
	}
	
	@Override
	public List<HospitalData> findByQtyB(Float flag) {
		return repository.findByQtyB(flag);
	}
	
	@Override
	public List<HospitalData> findByQtyAb(Float flag) {
		return repository.findByQtyAb(flag);
	}
	
	@Override
	public List<HospitalData> findByQtyO(Float flag) {
		return repository.findByQtyO(flag);
	}
	
	@Override
	public List<HospitalData> findBySignUpDate(String signUpDate){
		return repository.findBySignUpDate(signUpDate);
	}
	
	@Override
	public List<HospitalData> findByStatus(String status){
		return repository.findByStatus(status);
	}
	
	@Override
	public List<HospitalData> findByArea(String area){
		return repository.findByArea(area);
	}
}
