package com.taim.conduire.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.taim.conduire.domain.AccountData;

public interface AccountDataRepository extends JpaRepository<AccountData, Integer> {
    AccountData findByUsername(String username);
    void delete(Integer id);
    
    @Query(value = "SELECT a FROM AccountData a WHERE a.visible<>'D' and " +
            "LOWER(a.accountType) = LOWER(:accountType) and " +
            "LOWER(a.accountStatus) = LOWER(:accountStatus)")
    List<AccountData> findByAccounttypeAndAccountstatus(@Param("accountType") String accountType,@Param("accountStatus")  String accountStatus);
    
    List<AccountData> findByShopifyStoreUrl(String shopifyStoreUrl);
}