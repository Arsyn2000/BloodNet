package com.taim.conduire.components;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import com.taim.conduire.common.CommonHelper;
import com.taim.conduire.constants.ConstantCodes;
import com.taim.utils.RejectedExecutionHandlerImpl;

@Component
public class ApplicationStartup  implements ApplicationListener<ApplicationReadyEvent> {
	
	private static final Logger logger = LogManager.getLogger();
	private static final int CORE_POOL_SIZE = 10;
	private static final int MAX_POOL_SIZE = 10;
	private static final long UNIT_NUMBER = 5;

	@Override
	public void onApplicationEvent(final ApplicationReadyEvent event) {

		CommonHelper.ctx = event.getApplicationContext();
		//loadSchedulers();
	}
	
    private void loadSchedulers() {
    	logger.debug( "Inside loadSchedulers");
    	RejectedExecutionHandlerImpl rejectionHandler = new RejectedExecutionHandlerImpl();
        ThreadFactory threadFactory = Executors.defaultThreadFactory();
        
        ThreadPoolExecutor manageExecutorPoolBigCommerceCustomer = new ThreadPoolExecutor(CORE_POOL_SIZE , MAX_POOL_SIZE ,UNIT_NUMBER , TimeUnit.DAYS, new ArrayBlockingQueue<Runnable>(1000000), threadFactory, rejectionHandler);
        CommonHelper.setThreadPoolExecutor(ConstantCodes.THREAD_POOL_DOWNLOAD_SHOPIFY_ORDERS, manageExecutorPoolBigCommerceCustomer);
        
        ThreadPoolExecutor threadPoolExecutorAmazonOrders = new ThreadPoolExecutor(CORE_POOL_SIZE , MAX_POOL_SIZE ,UNIT_NUMBER , TimeUnit.DAYS, new ArrayBlockingQueue<Runnable>(1000000), threadFactory, rejectionHandler);
        CommonHelper.setThreadPoolExecutor(ConstantCodes.THREAD_POOL_DOWNLOAD_AMAZON_ORDERS, threadPoolExecutorAmazonOrders);
        
        logger.debug( "Leaving loadSchedulers");
	}


} 