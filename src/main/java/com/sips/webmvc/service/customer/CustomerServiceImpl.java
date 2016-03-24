package com.sips.webmvc.service.customer;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.dao.customer.CustomerDao;
import com.sips.webmvc.dto.customer.CustomerDTO;
import com.sips.webmvc.model.customer.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDao customerDao;

	@Override
	@Transactional(readOnly = true)
	public List<CustomerDTO> findAll() {
		return convertListDTO(customerDao.findAll());
	}
	
	@Override
	@Transactional
	public CustomerDTO findById(int id) {
		return convertDTO(customerDao.find(id));
	}
	
	@Override
	@Transactional
	public void update(CustomerDTO customerDto) {
		Customer customer =  convertEntite(customerDto);
		customerDao.update(customer);
	}

	@Override
	@Transactional
	public void remove(int id) {
		customerDao.remove(customerDao.find(id));
	}
	
	@Override
	public Customer convertEntite(CustomerDTO customerDto){
		Customer customer = new Customer();
		customer.setId(customerDto.getId());
		customer.setName(customerDto.getName());
		customer.setEmail(customerDto.getEmail());
		customer.setPhone(customerDto.getPhone());
		customer.setAddress(customerDto.getAddress());
		customer.setCreatedDate(customerDto.getCreatedDate());
		customer.setPassword(customerDto.getPassword());
		customer.setStatus(customerDto.getStatus());
		return customer;
	}
	
	@Override
	public CustomerDTO convertDTO(Customer customer){
		
		if( customer == null ){
			return null;
		}
		
		CustomerDTO dto = new CustomerDTO();
		dto.setId(customer.getId());
		dto.setName(customer.getName());
		dto.setEmail(customer.getEmail());
		dto.setPhone(customer.getPhone());
		dto.setPassword(customer.getPassword());
		dto.setAddress(customer.getAddress());
		dto.setCreatedDate(customer.getCreatedDate());
		dto.setStatus(customer.getStatus());
		return dto;
	}
	
	@Override
	public List<CustomerDTO> convertListDTO(List<Customer> customers){
		List<CustomerDTO> dtos = new ArrayList<CustomerDTO>();
		for (Customer customer : customers) {
			dtos.add(convertDTO(customer));
		}
		return dtos;
	}
	
	@Override
	@Transactional(readOnly = true)
	public CustomerDTO getById(int id) {
		return convertDTO( customerDao.find(id) );
	}
	
	@Override
	@Transactional(readOnly = true)
	public CustomerDTO getByEmailAndPassword(String email, String password) {
		return convertDTO( customerDao.findByEmailAndPassword(email, password) );
	}
	
	@Override
	@Transactional
	public CustomerDTO saveCustomer(CustomerDTO customerDto) {
		return convertDTO(customerDao.saveCustomer(convertEntite(customerDto)));
	}
	
	@Override
	@Transactional(readOnly = true)
	public CustomerDTO getByEmail(String email) {
		return convertDTO( customerDao.findByEmail(email) );
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<CustomerDTO> getCustomers(int firstResult, int maxResults) {
		return convertListDTO(customerDao.getCustomers(firstResult, maxResults));
	}
	
	@Override
	@Transactional(readOnly = true)
	public long countAll() {
		return customerDao.countAll();
	}
	
}
