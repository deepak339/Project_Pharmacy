package com.DAO.DashboardOperations.admin;

import com.DAO.ProductBatchPOJO;
import com.DAO.ProductPOJO;

public class AdminManageInventory implements IAdminManageInventory {

	@Override
	public ProductPOJO[] getAllProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addProduct(ProductPOJO productInfo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addProduct(String productName, ProductBatchPOJO batchInfo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeProduct(String productName) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateProduct(String productName, String productQuantity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ProductBatchPOJO getProductByName(String productName) {
		// TODO Auto-generated method stub
		return null;
	}

}
