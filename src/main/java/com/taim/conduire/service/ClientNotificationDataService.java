package com.taim.conduire.service;


import java.util.List;
import com.taim.conduire.domain.ClientNotificationData;
import com.taim.conduire.service.common.AbstractService;


public interface ClientNotificationDataService extends AbstractService<ClientNotificationData, Integer> {
	List<ClientNotificationData> findByType(String type);
	List<ClientNotificationData> findByStatus(Integer status);
	List<ClientNotificationData> findBySender(String sender);
	List<ClientNotificationData> findByReceiver(String receiver);
	List<ClientNotificationData> findByCnotificationId(Integer cnotificationId);
}