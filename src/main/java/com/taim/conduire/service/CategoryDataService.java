package com.taim.conduire.service;

import java.util.List;

import com.taim.conduire.domain.CategoryData;
import com.taim.conduire.service.common.AbstractService;

public interface CategoryDataService extends AbstractService<CategoryData, Integer> {
	 CategoryData findByName(String name);
	 List<CategoryData> findByStatus(String status);
}
