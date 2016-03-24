package com.sips.webmvc.dao.order;

import java.util.List;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.order.Order;

public interface OrderDao extends GenericDao<Order, Integer>{

	Order findById(int id);
	
	List<Order> findByAll();
	
	Order saveOrder(Order order);
	
	Order deleteById(int id);

	List<Integer> getProductIdsByTransactionId(Integer transactionId);

	List<Order> findByTransactionId(Integer transactionId);

	long countOrders(Integer transactionId);
	
}