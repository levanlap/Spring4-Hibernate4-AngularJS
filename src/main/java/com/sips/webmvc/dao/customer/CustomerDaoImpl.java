package com.sips.webmvc.dao.customer;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.customer.Customer;

@Repository
public class CustomerDaoImpl extends GenericDaoImpl<Customer, Integer>
		implements CustomerDao {

	public CustomerDaoImpl() {
		setClazz(Customer.class);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Customer findByEmailAndPassword(String email, String password){
		String hql = "from Customer o where o.email = :email and o.password = :password";
		List<Customer> customers = (List<Customer>) currentSession().createQuery(hql)
				.setParameter("email", email)
				.setParameter("password", password).list();
		if(customers != null && customers.size() > 0){
			return customers.get(0);
		}
		return null;
	}
	
	@Override
	public Customer saveCustomer(Customer customer) {
		if(customer.getId() != null){
			return (Customer) currentSession().merge(customer);
		}
		customer.setCreatedDate(new Date());
		currentSession().persist(customer);
		return customer;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Customer findByEmail(String email){
		String hql = "from Customer o where o.email = :email";
		List<Customer> customers = (List<Customer>) currentSession().createQuery(hql)
				.setParameter("email", email).list();
		if(customers != null && customers.size() > 0){
			return customers.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> getCustomers(int firstResult, int maxResults) {
		String hql = "from Customer order by name desc";
		Query query = currentSession().createQuery(hql);
		if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return (List<Customer>)query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public long countAll() {
		String hql = "select count(*) from Customer";
		Query query = currentSession().createQuery(hql);
		List<Long> counts  = (List<Long>) query.list();
		return counts.get(0).longValue();
	}

}