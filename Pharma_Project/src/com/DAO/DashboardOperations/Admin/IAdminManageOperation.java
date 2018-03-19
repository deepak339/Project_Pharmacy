package com.DAO.OperationDAO;


import com.DAO.Credentials;
import com.DAO.OperatorPOJO;


public interface IAdminManageOperation {

	
	public OperatorPOJO[] getAllOperators();
	
	public boolean addOperator(Credentials auth,OperatorPOJO operatorInfo);
	
	public boolean removeOperator(String operatorUserName);
	
	public boolean updateOperatorStatus(String operatorUserName,String status);
	
	public boolean updateOperatorBranch(String operatorUserName,String branch);
	
	public OperatorPOJO getOperatorByUserName(String operatorUserName);
	

}
