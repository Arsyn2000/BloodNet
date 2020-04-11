package com.taim.conduire.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.taim.conduire.domain.AccountData;
import com.taim.conduire.dto.AccountDataDTO;
import com.taim.conduire.service.common.AbstractService;

public interface AccountDataService extends UserDetailsService, AbstractService<AccountData, Integer> {
    AccountData create(AccountDataDTO accountDataDTO);
	List<AccountData> findByAccounttypeAndAccountstatus(String accounttype,String accountstatus);
	void deleteByAccountId(Integer id);
}
