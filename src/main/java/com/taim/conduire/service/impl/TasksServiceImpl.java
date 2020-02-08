package com.taim.conduire.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.taim.conduire.domain.Tasks;
import com.taim.conduire.repository.TasksRepository;
import com.taim.conduire.service.TasksService;
 
@Service
public class TasksServiceImpl implements TasksService {

	@Autowired
	private TasksRepository repository;
	
	@Override
	public JpaRepository<Tasks, Integer> getRepository() {
		return repository;
	}
   
}
