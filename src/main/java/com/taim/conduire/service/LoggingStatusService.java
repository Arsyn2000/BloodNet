package com.taim.conduire.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.taim.conduire.domain.LogStatus;
import com.taim.conduire.service.common.AbstractService;

public interface LoggingStatusService extends AbstractService<LogStatus, Integer> {
	Page<LogStatus> findLogStatusByAll(String sSearch, Pageable pageable);

	void updateLoglevel(int id, String packageName, String level);
}
