package com.sips.webmvc.dao.customer;

import java.util.List;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.customer.Customer;

public interface CustomerDao extends GenericDao<Customer, Integer> {

	Customer findByEmailAndPassword(String email, String password);

	Customer saveCustomer(Customer convertEntite);

	Customer findByEmail(String email);

	List<Customer> getCustomers(int firstResult, int maxResults);

	long countAll();

}