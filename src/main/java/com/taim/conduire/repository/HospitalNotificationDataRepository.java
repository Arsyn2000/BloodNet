//jpa-Java Persistent API

package com.taim.conduire.repository;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

import com.taim.conduire.domain.AdminNotificationData;
import com.taim.conduire.domain.FaqData;
import com.taim.conduire.domain.HospitalNotificationData;


public interface HospitalNotificationDataRepository extends JpaRepository<HospitalNotificationData, Integer> {
	List<HospitalNotificationData> findByType(String type);
	List<HospitalNotificationData> findByStatus(Integer status);
	List<HospitalNotificationData> findBySender(String sender);
	List<HospitalNotificationData> findByReceiver(String receiver);
	List<HospitalNotificationData> findByHnotificationId(Integer hnotificationId);
}