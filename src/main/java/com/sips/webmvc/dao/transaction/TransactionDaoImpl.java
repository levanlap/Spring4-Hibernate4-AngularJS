package com.sips.webmvc.dao.transaction;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.transaction.Transaction;

@Repository
public class TransactionDaoImpl extends GenericDaoImpl<Transaction, Integer> implements TransactionDao {

	@Override
	public Transaction findById(int id) {
		return (Transaction) currentSession().get(Transaction.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Transaction> findByAll() {
		List<Transaction> transactions = (List<Transaction>) currentSession().createQuery("from Transaction ").list();
		return transactions;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Transaction> getTransactions(int firstResult, int maxResults) {
		String hql = "from Transaction order by createdDate desc";
		Query query = currentSession().createQuery(hql);
		if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return (List<Transaction>)query.list();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public long countAll() {
		String hql = "select count(*) from Transaction";
		
		Query query = currentSession().createQuery(hql);
		
		List<Long> counts  = (List<Long>) query.list();
		
		return counts.get(0).longValue();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Transaction> findTransactionByStatus(int status) {
		List<Transaction> transactions = (List<Transaction>) currentSession().
				createQuery("from Transaction where status = :status").setParameter(0, status).list();
		return transactions;
	}

	@Override
	public Transaction saveTransaction(Transaction transaction) {
		if(transaction.getId() != null){
			return (Transaction) currentSession().merge(transaction);
		}
		transaction.setCreatedDate(new Date());
		currentSession().persist(transaction);
		return transaction;
	}

	@Override
	public Transaction deleteById(int id) {
		Transaction transaction = (Transaction) currentSession().get(Transaction.class, id);
		currentSession().delete(transaction);
		return transaction;
	}
	
	@Override
	public boolean updateStatus(int id, boolean status) {
		Transaction transaction = (Transaction) currentSession().get(Transaction.class, id);
		transaction.setStatus(status);
		currentSession().merge(transaction);
		return status;
	}

}