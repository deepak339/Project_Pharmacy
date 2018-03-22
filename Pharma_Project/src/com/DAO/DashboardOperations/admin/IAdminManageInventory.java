package com.DAO.DashboardOperations.admin;

import com.DAO.ProductBatchPOJO;
import com.DAO.ProductPOJO;

public interface IAdminManageInventory {

	
	public ProductPOJO[] getAllProducts();
	
	public boolean addProduct(ProductPOJO productInfo);
	
	public boolean addProduct(String productName, ProductBatchPOJO batchInfo);
	
	public boolean removeProduct(String productName);
	
	public ProductPOJO getProductByName(String productName);
	//hello-198806
	 
}
