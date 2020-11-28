package com.taim.conduire.repository;


import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taim.conduire.domain.AdminData;
import com.taim.conduire.domain.ClientData;
import com.taim.conduire.domain.TestData;

public interface AdminDataRepository extends JpaRepository<AdminData, Integer> {
    List<AdminData> findByPhoneNumber(String phoneNumber);
    List<AdminData> findByEmailId(String emailId);
}