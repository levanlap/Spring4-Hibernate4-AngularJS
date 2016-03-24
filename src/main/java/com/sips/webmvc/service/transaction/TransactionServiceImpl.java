package com.sips.webmvc.service.transaction;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.dao.order.OrderDao;
import com.sips.webmvc.dao.transaction.TransactionDao;
import com.sips.webmvc.dto.order.OrderDTO;
import com.sips.webmvc.dto.transaction.TransactionDTO;
import com.sips.webmvc.model.order.Order;
import com.sips.webmvc.model.transaction.Transaction;
import com.sips.webmvc.service.customer.CustomerService;
import com.sips.webmvc.service.order.OrderService;

@Service
@Transactional
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	private TransactionDao transactionDao;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public Transaction toEntity(TransactionDTO dto) {
		if(dto == null){
			return null;
		}
		Transaction entity = new Transaction();
		entity.setId(dto.getId());
		entity.setCustomer(customerService.convertEntite(dto.getCustomer()));
		entity.setCustomerName(dto.getCustomerName());
		entity.setCustomerEmail(dto.getCustomerEmail());
		entity.setCustomerPhone(dto.getCustomerPhone());
		entity.setCustomerAddress(dto.getCustomerAddress());
		entity.setReceiverName(dto.getReceiverName());
		entity.setReceiverEmail(dto.getReceiverEmail());
		entity.setReceiverPhone(dto.getReceiverPhone());
		entity.setReceiverAddress(dto.getReceiverAddress());
		entity.setPaymentMethod(dto.getPaymentMethod());
		entity.setStatus(dto.getStatus());
		entity.setCreatedDate(dto.getCreatedDate());
		return entity;
	}
	
	@Override
	public TransactionDTO toDTO(Transaction entity) {
		if(entity == null){
			return null;
		}
		TransactionDTO dto = new TransactionDTO();
		dto.setId(entity.getId());
		dto.setCustomer(customerService.convertDTO(entity.getCustomer()));
		dto.setCustomerName(entity.getCustomerName());
		dto.setCustomerEmail(entity.getCustomerEmail());
		dto.setCustomerPhone(entity.getCustomerPhone());
		dto.setCustomerAddress(entity.getCustomerAddress());
		dto.setReceiverName(entity.getReceiverName());
		dto.setReceiverEmail(entity.getReceiverEmail());
		dto.setReceiverPhone(entity.getReceiverPhone());
		dto.setReceiverAddress(entity.getReceiverAddress());
		dto.setPaymentMethod(entity.getPaymentMethod());
		dto.setStatus(entity.getStatus());
		dto.setCreatedDate(entity.getCreatedDate());
		return dto;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<TransactionDTO> toDTOs(List<Transaction> entities) {
		List<TransactionDTO> dtos = new ArrayList<TransactionDTO>();
		if( entities != null && entities.size() > 0){
			for( Transaction e : entities ){
				TransactionDTO dto = toDTO(e);
				dtos.add(dto);
			}
		}
		return dtos;
	}
	
	@Override
	public TransactionDTO saveTransaction(TransactionDTO transactionDTO) {
		Transaction transaction = toEntity(transactionDTO);
		transaction = transactionDao.saveTransaction(transaction);
		if(transactionDTO.getOrders() != null
				&& transactionDTO.getOrders().size() > 0){
			for(OrderDTO dto : transactionDTO.getOrders()){
				Order order = orderService.toEntity(dto);
				order.setTransaction(transaction);
				orderDao.saveOrder(order);
			}
		}
		return toDTO( transaction );
	}
	
	
	@Override
	@Transactional(readOnly = true)
	public long countAll() {
		return transactionDao.countAll();
	}

	@Override
	public TransactionDTO deleteById(int id) {
		return toDTO( transactionDao.deleteById(id) );
	}

	@Override
	@Transactional(readOnly = true)
	public List<TransactionDTO> getByAll() {
		return toDTOs(transactionDao.findByAll());
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<TransactionDTO> getTransactions(int firstResult, int maxResults) {
		return toDTOs(transactionDao.getTransactions(firstResult, maxResults));
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<TransactionDTO> findTransactionByStatus(int status) {
		return toDTOs(transactionDao.findTransactionByStatus(status));
	}

	@Override
	public TransactionDTO getById(int id) {
		return toDTO( transactionDao.findById(id) );
	}
	
	@Override
	public boolean updateStatus(int id, boolean status) {
		return transactionDao.updateStatus(id, status);
	}

}
