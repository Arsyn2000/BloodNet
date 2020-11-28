package com.taim.conduire.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taim.conduire.domain.HospitalData;

public interface HospitalDataRepository extends JpaRepository<HospitalData, Integer> {
    List<HospitalData> findByName(String name);
    List<HospitalData> findByEmailId(String emailId);
    List<HospitalData> findByPhoneNumber(String phoneNumber);
    List<HospitalData> findByQtyA(Float flag);
    List<HospitalData> findByQtyB(Float flag);
    List<HospitalData> findByQtyAb(Float flag);
    List<HospitalData> findByQtyO(Float flag);
    List<HospitalData> findBySignUpDate(String signUpDate);
    List<HospitalData> findByStatus(String status);
    List<HospitalData> findByArea(String area);
}