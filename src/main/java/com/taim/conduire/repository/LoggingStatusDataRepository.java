package com.taim.conduire.repository;

import com.taim.conduire.domain.LogStatus;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LoggingStatusDataRepository extends JpaRepository<LogStatus, Integer> {

    @Query("SELECT a FROM LogStatus a WHERE "
    		+ "CAST(a.id as string) LIKE LOWER(CONCAT('%',:sSearch, '%')) OR " 
    		+ " LOWER(a.packageName) LIKE LOWER(CONCAT('%',:sSearch, '%')) OR "
    		+ " LOWER(a.loggingLevel) LIKE LOWER(CONCAT('%',:sSearch, '%')) ")
    Page<LogStatus> findLogStatusByAll(@Param("sSearch") String sSearch,  Pageable pageable);
}