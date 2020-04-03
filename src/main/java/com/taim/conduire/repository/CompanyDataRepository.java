package com.taim.conduire.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taim.conduire.domain.CompanyData;

public interface CompanyDataRepository extends JpaRepository<CompanyData, Integer> {
	CompanyData findByName(String name);
    List<CompanyData> findByStatus(String status);
}