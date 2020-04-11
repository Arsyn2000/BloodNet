package com.taim.conduire.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.taim.conduire.domain.TestData;

public interface TestDataRepository extends JpaRepository<TestData, Integer> {
    List<TestData> findByFullName(String fullName);
    List<TestData> findByEmailAddress(String emailAddress);
}