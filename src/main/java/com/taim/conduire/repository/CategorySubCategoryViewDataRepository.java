package com.taim.conduire.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taim.conduire.domain.CategorySubCategoryViewData;
import com.taim.conduire.domain.SubCategoryData;

public interface CategorySubCategoryViewDataRepository extends JpaRepository<CategorySubCategoryViewData, Integer> {
	
}