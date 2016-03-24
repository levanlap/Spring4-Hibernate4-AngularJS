package com.sips.webmvc.service.transaction;

import java.util.List;

import com.sips.webmvc.dto.transaction.TransactionDTO;
import com.sips.webmvc.model.transaction.Transaction;


public interface TransactionService {
	
	Transaction toEntity(TransactionDTO dto);
	
	TransactionDTO toDTO(Transaction entity);
	
	TransactionDTO saveTransaction(TransactionDTO transactionDTO);
	
	TransactionDTO deleteById(int id);
	
	List<TransactionDTO> toDTOs(List<Transaction> entities);

	List<TransactionDTO> getByAll();
	
	TransactionDTO getById(int id);

	boolean updateStatus(int id, boolean status);

	List<TransactionDTO> findTransactionByStatus(int status);

	List<TransactionDTO> getTransactions(int firstResult, int maxResults);

	long countAll();
	
}
