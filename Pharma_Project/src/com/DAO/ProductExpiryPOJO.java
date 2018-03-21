package com.DAO;

public class ProductExpiryPOJO {
	private ProductPOJO productInfo;
	private String batchId;
	private String productExpiryDate;
	private String productQuantity;
	public ProductPOJO getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(ProductPOJO productInfo) {
		this.productInfo = productInfo;
	}
	public String getBatchId() {
		return batchId;
	}
	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}
	public String getProductExpiryDate() {
		return productExpiryDate;
	}
	public void setProductExpiryDate(String productExpiryDate) {
		this.productExpiryDate = productExpiryDate;
	}
	public String getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;
	}
	@Override
	public String toString() {
		return "ProductExpiryPOJO [productInfo=" + productInfo + ", BatchId=" + batchId + ", ProductExpiryDate="
				+ productExpiryDate + ", ProductQuantity=" + productQuantity + "]";
	}
	

}
