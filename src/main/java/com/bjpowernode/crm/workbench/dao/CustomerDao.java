package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.Clue;
import com.bjpowernode.crm.workbench.domain.Customer;

public interface CustomerDao {

    Customer getCustomerByName(String company);

    int addCustomer(Clue clue);
}
