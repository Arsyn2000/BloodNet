package com.taim.conduire.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.taim.conduire.domain.AccountData;
import com.taim.conduire.domain.CategoryData;

public interface CategoryDataRepository extends JpaRepository<CategoryData, Integer> {
    CategoryData findByName(String name);
    List<CategoryData> findByStatus(String status);
    
    
}