package com.taim.conduire.service.impl;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import com.taim.conduire.domain.AdminNotificationData;
import com.taim.conduire.domain.HospitalNotificationData;
import com.taim.conduire.repository.AdminNotificationDataRepository;
import com.taim.conduire.repository.HospitalNotificationDataRepository;
import com.taim.conduire.service.AdminNotificationDataService;
import com.taim.conduire.service.HospitalNotificationDataService;

@Service
public class HospitalNotificationDataServiceImpl implements HospitalNotificationDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private HospitalNotificationDataRepository repository;
    
    @Override
    public JpaRepository<HospitalNotificationData, Integer> getRepository() {
        return repository;
    }

	@Override
	public List<HospitalNotificationData> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.DESC, "hnotificationId");
	}

	@Override
	public List<HospitalNotificationData> findByType(String type) {
		return repository.findByType(type);
	}

	@Override
	public List<HospitalNotificationData> findByStatus(Integer status) {
		return repository.findByStatus(status);
	}
	
	@Override
	public List<HospitalNotificationData> findBySender(String sender) {
		return repository.findBySender(sender);
	}
		
	@Override
	public List<HospitalNotificationData> findByReceiver(String receiver) {
		return repository.findByReceiver(receiver);
	}
	
	@Override
	public List<HospitalNotificationData> findByHnotificationId(Integer hnotificationId) {
		return repository.findByHnotificationId(hnotificationId);
	}
}
