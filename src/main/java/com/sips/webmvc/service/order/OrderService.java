package com.sips.webmvc.service.order;

import java.util.List;

import com.sips.webmvc.dto.order.OrderDTO;
import com.sips.webmvc.model.order.Order;


public interface OrderService {
	
	OrderDTO toDTO(Order entity);
	
	List<OrderDTO> toDTOs(List<Order> entities);
	
	Order toEntity(OrderDTO dto);
	
	List<Order> toEntities(List<OrderDTO> dtos);
	
	OrderDTO saveOrder(OrderDTO order);
	
	List<OrderDTO> saveOrders(List<OrderDTO> orders);
	
	OrderDTO deleteById(int id);
	
	List<OrderDTO> getByAll();
	
	OrderDTO getById(int id);

	List<Integer> getProductIdsByTransactionId(Integer transactionId);

	List<OrderDTO> getByTransactionId(Integer transactionId);
	
	long countOrders(Integer transactionId);
	
}
