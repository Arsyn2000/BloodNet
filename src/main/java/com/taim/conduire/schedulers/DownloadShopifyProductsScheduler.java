package com.taim.conduire.schedulers;

import java.util.HashMap;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.taim.conduire.constants.ConstantCodes;
import com.taim.conduire.domain.AccountData;
import com.taim.conduire.service.AccountDataService;

public class DownloadShopifyProductsScheduler {
	private static final Logger logger = LogManager.getLogger();
	
	@Autowired
	AccountDataService accountDataService;
	
}
