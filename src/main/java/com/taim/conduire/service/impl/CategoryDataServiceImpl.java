package com.taim.conduire.service.impl;

import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.domain.CategoryData;
import com.taim.conduire.dto.AccountDataDTO;
import com.taim.conduire.repository.AccountDataRepository;
import com.taim.conduire.repository.CategoryDataRepository;
import com.taim.conduire.service.AccountDataService;
import com.taim.conduire.service.CategoryDataService;

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
public class CategoryDataServiceImpl implements CategoryDataService {
	private static final Logger logger = LogManager.getLogger();

    @Autowired
    private CategoryDataRepository repository;
    
    @Override
    public JpaRepository<CategoryData, Integer> getRepository() {
        return repository;
    }

    @Override
    public CategoryData findByName(String name) {
    	return repository.findByName(name);
    }

	@Override
	public List<CategoryData> findByStatus(String status) {
		return repository.findByStatus(status);
	}
}
