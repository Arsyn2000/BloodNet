package com.taim.conduire.service;

import java.util.Date;
import java.util.List;
import com.taim.conduire.domain.ClientData;
import com.taim.conduire.service.common.AbstractService;

public interface ClientDataService extends AbstractService<ClientData, Integer> {
		List<ClientData> findByFirstName(String firstName);
		List<ClientData> findByLastName(String lastName);
	 	List<ClientData> findByPhoneNumber(String phoneNumber);
	 	List<ClientData> findByEmailId(String emailId);
	    List<ClientData> findByBloodGroup(String bloodGroup);
	    List<ClientData> findByBloodDonationCount(Integer bloodDonationCount);
	    List<ClientData> findBySignUpDate(String signUpDate);
	    List<ClientData> findByAadharNumber(String aadharNumber);
	    List<ClientData> findByStatus(String status);
	    List<ClientData> findByArea(String area);
}
