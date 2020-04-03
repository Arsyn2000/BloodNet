package com.taim.conduire.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.taim.conduire.domain.DistributorData;

public interface DistributorDataRepository extends JpaRepository<DistributorData, Integer> {
	DistributorData findByName(String name);
    List<DistributorData> findByStatus(String status);
}