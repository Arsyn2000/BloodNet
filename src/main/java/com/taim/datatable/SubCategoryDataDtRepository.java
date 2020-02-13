package com.taim.datatable;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;

import com.taim.conduire.domain.AccountData;
import com.taim.conduire.domain.CategoryData;
import com.taim.conduire.domain.SubCategoryData;

@Repository
public interface SubCategoryDataDtRepository extends DataTablesRepository<SubCategoryData, Integer>  {
   
}	