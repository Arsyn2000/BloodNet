//jpa-Java Persistent API

package com.taim.conduire.repository;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.taim.conduire.domain.ClientNotificationData;


public interface ClientNotificationDataRepository extends JpaRepository<ClientNotificationData, Integer> {
	List<ClientNotificationData> findByType(String type);
	List<ClientNotificationData> findByStatus(Integer status);
	List<ClientNotificationData> findBySender(String sender);
	List<ClientNotificationData> findByReceiver(String receiver);
	List<ClientNotificationData> findByCnotificationId(Integer cnotificationId);
}