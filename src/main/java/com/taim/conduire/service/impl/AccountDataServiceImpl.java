package com.taim.conduire.service.impl;

import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.dto.AccountDataDTO;
import com.taim.conduire.repository.AccountDataRepository;
import com.taim.conduire.service.AccountDataService;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Date;
import java.util.List;

@Service
public class AccountDataServiceImpl implements AccountDataService {
	private static final Logger logger = LogManager.getLogger();
    @Autowired
    private Mapper mapper;
    
    @Autowired
    private AccountDataRepository repository;
    
    @Override
    public JpaRepository<AccountData, Integer> getRepository() {
        return repository;
    }

    @Transactional(readOnly = true)
    @Override
    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        AccountData accountData = repository.findByUsername(username);
        if (accountData == null) {
            throw new UsernameNotFoundException(username);
        }
        return accountData;
    }

    @Override
    public AccountData create(AccountDataDTO accountDataDTO) {
        accountDataDTO.setId(null);
        accountDataDTO.setCreatedate(new Date());
        accountDataDTO.setWelcomeEmailSent("Y");
        accountDataDTO.setVisible('Y');
        accountDataDTO.setWelcomeEmailSent("N");
        accountDataDTO.setAccountstatus("ACTIVE");
        accountDataDTO.setSystemgenerated("Y");
        AccountData accountData = mapper.map(accountDataDTO, AccountData.class);
        return create(accountData);
    }

	@Override
	public List<AccountData> findByAccounttypeAndAccountstatus(String accounttype, String accountstatus) {
		logger.debug("check service impl");
		return repository.findByAccounttypeAndAccountstatus(accounttype, accountstatus);
	}
	
	@Override
	public List<AccountData> findByShopifyStoreUrl(String shopifyStoreUrl) {
		return repository.findByShopifyStoreUrl(shopifyStoreUrl);
	}

	@Override
	@Transactional
	public void deleteByAccountId(Integer id) {
		repository.delete(id);
	}
}
