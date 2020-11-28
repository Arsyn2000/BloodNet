package com.taim.conduire.service;

import java.util.List;
import com.taim.conduire.domain.HospitalData;
import com.taim.conduire.service.common.AbstractService;

public interface HospitalDataService extends AbstractService<HospitalData, Integer> {
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
