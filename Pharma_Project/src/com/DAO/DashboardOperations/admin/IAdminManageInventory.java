package com.DAO.DashboardOperations.admin;

import com.DAO.ProductBatchPOJO;
import com.DAO.ProductPOJO;

public interface IAdminManageInventory {

	
	public ProductPOJO[] getAllProducts();//Product object must have arraylist of batch objects,
	
	public boolean addProduct(ProductPOJO productInfo);
	
	public boolean addProduct(String productName, ProductBatchPOJO batchInfo);
	
	public boolean removeProduct(String productName);//need to take of batches of product
	
	public boolean updateProduct(String productName, String productQuantity);
	
	public ProductBatchPOJO getProductByName(String productName); // it must return array of product batches
	

	
	 
}
