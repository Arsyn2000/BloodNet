package com.taim.conduire.service;

import java.util.List;

import com.taim.conduire.domain.TestData;
import com.taim.conduire.service.common.AbstractService;

public interface TestDataService extends AbstractService<TestData, Integer> {
	 List<TestData> findByFullName(String fullName);
	 List<TestData> findByEmailAddress(String emailAddress);
}
