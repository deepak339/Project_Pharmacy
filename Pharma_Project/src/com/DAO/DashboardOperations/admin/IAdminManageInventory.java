package com.DAO.DashboardOperations.admin;

import com.DAO.Credentials;
import com.DAO.ProductExpiryPOJO;
import com.DAO.ProductPOJO;

public interface IAdminManageInventory {
	
	public ProductPOJO[] getAllProducts();
	public boolean addProduct(Credentials auth, ProductExpiryPOJO productInfo);
	

}
