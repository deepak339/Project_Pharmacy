package com.DAO.DashboardOperations.admin;

import com.DAO.ProductBatchPOJO;
import com.DAO.ProductPOJO;

public interface IAdminManageInventory {

	
	public ProductPOJO[] getAllProducts();
	
	public boolean addProduct(ProductBatchPOJO productInfo);
	
	public boolean removeProduct(String productName);
	
	public boolean updateProduct(String productName, String productQuantity);
	
	public ProductBatchPOJO getProductByName(String productName);
	
	 
}
