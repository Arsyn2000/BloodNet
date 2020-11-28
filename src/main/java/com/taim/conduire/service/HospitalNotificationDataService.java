package com.taim.conduire.service;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

import com.taim.conduire.domain.AdminNotificationData;
import com.taim.conduire.domain.FaqData;
import com.taim.conduire.domain.HospitalNotificationData;
import com.taim.conduire.service.common.AbstractService;


public interface HospitalNotificationDataService extends AbstractService<HospitalNotificationData, Integer> {
	List<HospitalNotificationData> findByType(String type);
	List<HospitalNotificationData> findByStatus(Integer status);
	List<HospitalNotificationData> findBySender(String sender);
	List<HospitalNotificationData> findByReceiver(String receiver);
	List<HospitalNotificationData> findByHnotificationId(Integer hnotificationId);
}