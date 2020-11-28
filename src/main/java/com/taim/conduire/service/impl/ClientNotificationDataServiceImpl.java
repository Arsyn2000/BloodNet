package com.taim.conduire.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import com.taim.conduire.domain.ClientNotificationData;
import com.taim.conduire.repository.ClientNotificationDataRepository;
import com.taim.conduire.service.ClientNotificationDataService;

@Service
public class ClientNotificationDataServiceImpl implements ClientNotificationDataService {

    @Autowired
    private ClientNotificationDataRepository repository;
    
    @Override
    public JpaRepository<ClientNotificationData, Integer> getRepository() {
        return repository;
    }

	@Override
	public List<ClientNotificationData> findAll() {
		return repository.findAll(sortByNameAsc());
	}
	
	private Sort sortByNameAsc() {
	        return new Sort(Sort.Direction.DESC, "cnotificationId");
	}

	@Override
	public List<ClientNotificationData> findByType(String type) {
		return repository.findByType(type);
	}

	@Override
	public List<ClientNotificationData> findByStatus(Integer status) {
		return repository.findByStatus(status);
	}
	
	@Override
	public List<ClientNotificationData> findBySender(String sender) {
		return repository.findBySender(sender);
	}
		
	@Override
	public List<ClientNotificationData> findByReceiver(String receiver) {
		return repository.findByReceiver(receiver);
	}
	
	@Override
	public List<ClientNotificationData> findByCnotificationId(Integer cnotificationId) {
		return repository.findByCnotificationId(cnotificationId);
	}
}
