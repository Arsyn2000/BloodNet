package com.taim.conduire.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.taim.conduire.domain.SubCategoryData;

public interface SubCategoryDataRepository extends JpaRepository<SubCategoryData, Integer> {
	SubCategoryData findByName(String name);
    List<SubCategoryData> findByStatus(String status);
    List<SubCategoryData> findByCategoryId(Integer categoryId);
}