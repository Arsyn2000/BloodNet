package com.taim.conduire.service;

import java.util.List;

import com.taim.conduire.domain.SubCategoryData;
import com.taim.conduire.service.common.AbstractService;

public interface SubCategoryDataService extends AbstractService<SubCategoryData, Integer> {
	SubCategoryData findByName(String name);
    List<SubCategoryData> findByStatus(String status);
    List<SubCategoryData> findByCategoryId(Integer categoryId);
}
