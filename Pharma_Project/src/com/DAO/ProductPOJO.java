package com.DAO;

public class ProductPOJO {
	private String productId;
	private String productName;
	private String productType;
	private String productPrice;
	private SupplierPOJO supplierInfo;
	
	public ProductPOJO() {
		
	}
	
	public ProductPOJO(String productId, String productName, String productType, String productPrice,
			SupplierPOJO supplierInfo) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productType = productType;
		this.productPrice = productPrice;
		this.supplierInfo = supplierInfo;
	}

	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public SupplierPOJO getSupplierInfo() {
		return supplierInfo;
	}
	public void setSupplierInfo(SupplierPOJO supplierInfo) {
		this.supplierInfo = supplierInfo;
	}
	@Override
	public String toString() {
		return "ProductPOJO [productId=" + productId + ", productName=" + productName + ", productType=" + productType
				+ ", productPrice=" + productPrice + ", supplierInfo=" + supplierInfo + "]";
	}
	
	

}
