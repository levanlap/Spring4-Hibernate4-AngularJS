package com.sips.webmvc.service.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.dao.order.OrderDao;
import com.sips.webmvc.dto.order.OrderDTO;
import com.sips.webmvc.model.order.Order;
import com.sips.webmvc.service.product.ProductService;
import com.sips.webmvc.service.transaction.TransactionService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private TransactionService transactionService;
	
	@Autowired
	private ProductService productService;
	
	@Override
	@Transactional(readOnly = true)
	public OrderDTO toDTO(Order entity) {
		if(entity == null){
			return null;
		}
		OrderDTO dto = new OrderDTO();
		dto.setId(entity.getId());
		dto.setPrice(entity.getPrice());
		dto.setPriceType(entity.getPriceType());
		dto.setData(entity.getData());
		dto.setProduct(productService.toDTO(entity.getProduct()));
		dto.setQty(entity.getQty());
		dto.setStatus(entity.getStatus());
		dto.setTransaction(transactionService.toDTO(entity.getTransaction()));
		return dto;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<OrderDTO> toDTOs(List<Order> entities) {
		List<OrderDTO> dtos = new ArrayList<OrderDTO>();
		if( entities != null && entities.size() > 0){
			for( Order e : entities ){
				OrderDTO dto = toDTO(e);
				dtos.add(dto);
			}
		}
		return dtos;
	}
	
	@Override
	public Order toEntity(OrderDTO dto) {
		if(dto == null){
			return null;
		}
		Order entity = new Order();
		entity.setId(dto.getId());
		entity.setPrice(dto.getPrice());
		entity.setPriceType(dto.getPriceType());
		entity.setData(dto.getData());
		entity.setProduct(productService.toEntity(dto.getProduct()));
		entity.setQty(dto.getQty());
		entity.setStatus(dto.getStatus());
		entity.setTransaction(transactionService.toEntity(dto.getTransaction()));
		return entity;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Order> toEntities(List<OrderDTO> dtos) {
		List<Order> entities = new ArrayList<Order>();
		if( dtos != null && dtos.size() > 0){
			for( OrderDTO dto : dtos ){
				Order entity = toEntity(dto);
				entities.add(entity);
			}
		}
		return entities;
	}
	
	@Override
	public OrderDTO saveOrder(OrderDTO order) {
		return toDTO( orderDao.saveOrder(toEntity(order)) );
	}
	
	@Override
	public List<OrderDTO> saveOrders(List<OrderDTO> orders) {
		if(orders != null){
			for(OrderDTO order : orders){
				order = toDTO( orderDao.saveOrder(toEntity(order)) );
			}
		}
		return orders;
	}

	@Override
	public OrderDTO deleteById(int id) {
		return toDTO( orderDao.deleteById(id) );
	}

	@Override
	@Transactional(readOnly = true)
	public List<OrderDTO> getByAll() {
		return toDTOs(orderDao.findByAll());
	}

	@Override
	@Transactional(readOnly = true)
	public OrderDTO getById(int id) {
		return toDTO(orderDao.findById(id));
	}

	@Override
	@Transactional(readOnly = true)
	public List<Integer> getProductIdsByTransactionId(Integer transactionId) {
		return orderDao.getProductIdsByTransactionId(transactionId);
	}

	@Override
	@Transactional(readOnly = true)
	public List<OrderDTO> getByTransactionId(Integer transactionId) {
		return toDTOs( orderDao.findByTransactionId(transactionId) );
	}

	@Override
	@Transactional(readOnly = true)
	public long countOrders(Integer transactionId) {
		return orderDao.countOrders(transactionId);
	}

}
