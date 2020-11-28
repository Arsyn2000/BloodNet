package com.taim.conduire.service;

import java.util.Date;
import java.util.List;

import com.taim.conduire.domain.AdminData;
import com.taim.conduire.domain.ClientData;
import com.taim.conduire.service.common.AbstractService;

public interface AdminDataService extends AbstractService<AdminData, Integer> {
	List<AdminData> findByPhoneNumber(String phoneNumber);
    List<AdminData> findByEmailId(String emailId);
}
