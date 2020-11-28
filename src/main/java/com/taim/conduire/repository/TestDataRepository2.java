//jpa-Java Persistent API

package com.taim.conduire.repository;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.taim.conduire.domain.TestData2;

public interface TestDataRepository2 extends JpaRepository<TestData2, Integer> {
	List<TestData2> findByFullName(String fullName);
    List<TestData2> findByEmailAddress(String emailAddress);
}