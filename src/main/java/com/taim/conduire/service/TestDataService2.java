package com.taim.conduire.service;

import java.util.List;
import com.taim.conduire.domain.TestData2;
import com.taim.conduire.service.common.AbstractService;

public interface TestDataService2 extends AbstractService<TestData2, Integer> {
	 List<TestData2> findByFullName(String fullName);
	 List<TestData2> findByEmailAddress(String emailAddress);
}
