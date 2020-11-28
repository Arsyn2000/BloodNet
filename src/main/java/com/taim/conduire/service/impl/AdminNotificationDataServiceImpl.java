package com.taim.conduire.service.impl;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import com.taim.conduire.domain.AdminNotificationData;
import com.taim.conduire.repository.AdminNotificationDataRepository;
import com.taim.conduire.service.AdminNotificationDataService;

@Service
public class AdminNotificationDataServiceImpl implements AdminNotificationDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private AdminNotificationDataRepository repository;
    
    @Override
    public JpaRepository<AdminNotificationData, Integer> getRepository() {
        return repository;
    }

	@Override
	public List<AdminNotificationData> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.DESC, "notificationId");
	}

	@Override
	public List<AdminNotificationData> findByType(String type) {
		return repository.findByType(type);
	}

	@Override
	public List<AdminNotificationData> findByStatusAdmin(Integer status) {
		return repository.findByStatusAdmin(status);
	}
	
	@Override
	public List<AdminNotificationData> findBySender(String sender) {
		return repository.findBySender(sender);
	}
		
	
}
