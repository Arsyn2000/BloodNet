package com.taim.conduire.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taim.conduire.domain.Tasks;

public interface TasksRepository extends JpaRepository<Tasks, Integer> {

}