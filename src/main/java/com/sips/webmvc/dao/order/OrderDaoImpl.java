package com.sips.webmvc.dao.order;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.order.Order;

@Repository
public class OrderDaoImpl extends GenericDaoImpl<Order, Integer> implements OrderDao {

	@Override
	public Order findById(int id) {
		return (Order) currentSession().get(Order.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findByAll() {
		List<Order> orders = (List<Order>) currentSession().createQuery("from Order").list();
		return orders;
	}

	@Override
	public Order saveOrder(Order order) {
		if(order.getId() != null){
			return (Order) currentSession().merge(order);
		}
		currentSession().persist(order);
		return order;
	}

	@Override
	public Order deleteById(int id) {
		Order order = (Order) currentSession().get(Order.class, id);
		currentSession().delete(order);
		return order;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getProductIdsByTransactionId(Integer transactionId) {
		String hql = "select o.product.id from Order o where o.transaction.id = :transactionId";
		List<Integer> ids = (List<Integer>) currentSession().createQuery(hql).setParameter("transactionId", transactionId).list();
		return ids;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findByTransactionId(Integer transactionId) {
		String hql = "from Order o where o.transaction.id = :transactionId";
		List<Order> orders = (List<Order>) currentSession().createQuery(hql).setParameter("transactionId", transactionId).list();
		return orders;
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countOrders(Integer transactionId) {
		String hql = "select count(o.id) from Order o where o.transaction.id = :transactionId";
		List<Long> counts  = (List<Long>) currentSession().createQuery(hql).setParameter("transactionId", transactionId).list();
		return counts.get(0).longValue();
	}
	

}