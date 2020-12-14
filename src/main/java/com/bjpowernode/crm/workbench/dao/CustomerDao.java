package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.Clue;
import com.bjpowernode.crm.workbench.domain.Customer;

import java.util.List;

public interface CustomerDao {

    Customer getCustomerByName(String company);

    int addCustomerByClue(Clue clue);

    List<String> getCustomerName(String name);

    String getCustomerIdByName(String customerId);

    int addCustomer(Customer customer);
}
