package com.DAO.DashboardOperations.operator;

import com.DAO.ProductPOJO;

public interface IGenerateTranscation {

	public ProductPOJO searchProductByName(String productName);
	
	public boolean checkAvailability(int quantity);
	
	
	
	
	
}
