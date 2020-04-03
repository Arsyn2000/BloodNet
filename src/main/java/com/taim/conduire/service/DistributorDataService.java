package com.taim.conduire.service;

import java.util.List;

import com.taim.conduire.domain.DistributorData;
import com.taim.conduire.service.common.AbstractService;

public interface DistributorDataService extends AbstractService<DistributorData, Integer> {
	DistributorData findByName(String name);
	 List<DistributorData> findByStatus(String status);
}
