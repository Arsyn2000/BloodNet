//jpa-Java Persistent API

package com.taim.conduire.repository;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.taim.conduire.domain.FaqData;


public interface FaqDataRepository extends JpaRepository<FaqData, Integer> {
	List<FaqData> findByStatus(String status);
}