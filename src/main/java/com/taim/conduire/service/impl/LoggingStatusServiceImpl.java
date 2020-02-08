package com.taim.conduire.service.impl;

import com.taim.conduire.domain.LogStatus;
import com.taim.conduire.repository.LoggingStatusDataRepository;
import com.taim.conduire.service.LoggingStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public class LoggingStatusServiceImpl implements LoggingStatusService {

	@Autowired
    private LoggingStatusDataRepository repository;

    @Override
    public JpaRepository<LogStatus, Integer> getRepository() {
        return repository;
    }

	@Override
	public Page<LogStatus> findLogStatusByAll(String sSearch, Pageable pageable) {
		return repository.findLogStatusByAll(sSearch, pageable);
	}

	@Override
	public void updateLoglevel(int id, String packageName, String level) {
		try {
			LogStatus logStatus = new LogStatus();
			logStatus.setPackageName(packageName);
			logStatus.setLoggingLevel(level);
			logStatus.setId(id);
			repository.save(logStatus);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
   
}
