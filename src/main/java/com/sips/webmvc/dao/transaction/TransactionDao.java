package com.sips.webmvc.dao.transaction;

import java.util.List;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.transaction.Transaction;

public interface TransactionDao extends GenericDao<Transaction, Integer>{

	Transaction findById(int id);
	
	List<Transaction> findByAll();
	
	Transaction saveTransaction(Transaction transaction);
	
	Transaction deleteById(int id);

	boolean updateStatus(int id, boolean status);

	List<Transaction> findTransactionByStatus(int status);

	List<Transaction> getTransactions(int firstResult, int maxResults);

	long countAll();
	
}