package com.sips.webmvc.service.customer;

import java.util.List;

import com.sips.webmvc.dto.customer.CustomerDTO;
import com.sips.webmvc.model.customer.Customer;

public interface CustomerService {

	List<CustomerDTO> findAll();

	void update(CustomerDTO customerDto);

	CustomerDTO findById(int id);

	void remove(int id);

	Customer convertEntite(CustomerDTO customerDto);

	CustomerDTO convertDTO(Customer customer);

	List<CustomerDTO> convertListDTO(List<Customer> customers);

	CustomerDTO getById(int id);

	CustomerDTO getByEmailAndPassword(String email, String password);

	CustomerDTO saveCustomer(CustomerDTO customerDto);

	CustomerDTO getByEmail(String email);

	List<CustomerDTO> getCustomers(int firstResult, int maxResults);

	long countAll();

}
