package com.sips.webmvc.controller.backend;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.dto.order.OrderDTO;
import com.sips.webmvc.dto.transaction.TransactionDTO;
import com.sips.webmvc.service.order.OrderService;
import com.sips.webmvc.service.transaction.TransactionService;

@Controller
public class TransactionController extends BaseController{

	@Autowired
	private TransactionService transactionService;

	@Autowired
	private OrderService orderService;
	@RequestMapping(value = "/admin/transactions", method = RequestMethod.GET)
	public ModelAndView catalogs() {
		List<TransactionDTO> transactions = transactionService.getByAll();
		ModelAndView model = new ModelAndView("bac_transaction",
				"transactions", transactions);
		long total = transactionService.countAll();
		model.addObject("total", total);
		model.addObject("transactionMenuActive", "active");
		return model;
	}

	@RequestMapping(value = "/admin/listTransactions/{currentPage}/{pageSize}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<TransactionDTO> listTransactions(@PathVariable("currentPage") int currentPage,@PathVariable("pageSize") int pageSize,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<TransactionDTO> transactions = transactionService.getTransactions((currentPage-1)*pageSize, pageSize);
		return transactions;
	}

	@RequestMapping(value = "/admin/saveTransaction", method = RequestMethod.POST)
	public @ResponseBody TransactionDTO saveTransaction(
			@RequestBody TransactionDTO transaction) {
		return transactionService.saveTransaction(transaction);
	}

	@RequestMapping(value = "/admin/listOrdersByTransaction", method = RequestMethod.GET)
	public @ResponseBody List<OrderDTO> listOrdersByTransaction(
			@RequestParam("transactionId") int transactionId) {
		return orderService.getByTransactionId(transactionId);
	}
	
	@RequestMapping(value = "/admin/deleteTransaction/{id}", method = RequestMethod.DELETE)
	public @ResponseBody void deleteProduct(@PathVariable("id") int id) {
		transactionService.deleteById(id);
	}

	@RequestMapping(value = "/admin/resolveTransaction/{id}", method = RequestMethod.POST)
	public @ResponseBody void resolveTransaction(@PathVariable("id") int id) {
		transactionService.updateStatus(id, true);
	}

}
