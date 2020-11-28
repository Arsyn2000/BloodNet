package com.taim.conduire.service;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

import com.taim.conduire.domain.AdminNotificationData;
import com.taim.conduire.domain.FaqData;
import com.taim.conduire.service.common.AbstractService;


public interface AdminNotificationDataService extends AbstractService<AdminNotificationData, Integer> {
	List<AdminNotificationData> findByType(String type);
	List<AdminNotificationData> findByStatusAdmin(Integer status);
	List<AdminNotificationData> findBySender(String sender);
}