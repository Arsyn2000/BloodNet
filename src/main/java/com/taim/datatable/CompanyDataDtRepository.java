package com.taim.datatable;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;

import com.taim.conduire.domain.CompanyData;

@Repository
public interface CompanyDataDtRepository extends DataTablesRepository<CompanyData, Integer>  {
   
}	