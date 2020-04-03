package com.taim.conduire.service;

import java.util.List;

import com.taim.conduire.domain.CompanyData;
import com.taim.conduire.service.common.AbstractService;

public interface CompanyDataService extends AbstractService<CompanyData, Integer> {
	CompanyData findByName(String name);
	 List<CompanyData> findByStatus(String status);
}
