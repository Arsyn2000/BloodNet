package com.taim.datatable;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;
import com.taim.conduire.domain.DistributorData;

@Repository
public interface DistributorDataDtRepository extends DataTablesRepository<DistributorData, Integer>  {
   
}	