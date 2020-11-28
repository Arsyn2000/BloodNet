//jpa-Java Persistent API

package com.taim.conduire.repository;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

import com.taim.conduire.domain.AdminNotificationData;
import com.taim.conduire.domain.FaqData;


public interface AdminNotificationDataRepository extends JpaRepository<AdminNotificationData, Integer> {
	List<AdminNotificationData> findByType(String type);
	List<AdminNotificationData> findByStatusAdmin(Integer status);
	List<AdminNotificationData> findBySender(String sender);
}