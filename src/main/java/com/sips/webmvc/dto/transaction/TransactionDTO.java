package com.sips.webmvc.dto.transaction;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sips.webmvc.dto.customer.CustomerDTO;
import com.sips.webmvc.dto.order.OrderDTO;

public class TransactionDTO {

	private Integer id;
	private CustomerDTO customer;
	private String customerName;
	private String customerEmail;
	private String customerPhone;
	private String customerAddress;
	private String receiverName;
	private String receiverEmail;
	private String receiverPhone;
	private String receiverAddress;
	private String paymentMethod;
	private Boolean status;
	private Date createdDate;
	private List<OrderDTO> orders;
	private List<Integer> orderedProductIds;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public CustomerDTO getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerDTO customer) {
		this.customer = customer;
	}
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverEmail() {
		return receiverEmail;
	}
	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public List<OrderDTO> getOrders() {
		if(orders == null){
			orders = new ArrayList<OrderDTO>();
		}
		return orders;
	}
	public void setOrders(List<OrderDTO> orders) {
		this.orders = orders;
	}
	
	public void setCountOrders(long countOrders){
		// Because we have getCountOrders() so must create this method although don't need to use it
		// This method is to resolve parsing js object at client to java object at server of spring.
		// If do not have this method. There will be 400 error (bad request)
	}
	
	public int getCountOrders(){
		return getOrders().size();
	}
	
	public List<Integer> getOrderedProductIds() {
		if(orderedProductIds == null){
			orderedProductIds = new ArrayList<Integer>();
		}
		return orderedProductIds;
	}
	public void setOrderedProductIds(List<Integer> orderedProductIds) {
		this.orderedProductIds = orderedProductIds;
	}
	
}
