package com.taim.conduire.service;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.taim.conduire.domain.FaqData;
import com.taim.conduire.service.common.AbstractService;


public interface FaqDataService extends AbstractService<FaqData, Integer> {
	List<FaqData> findByStatus(String status);
}