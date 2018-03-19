package com.DAO.OperationDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DAO.Credentials;
import com.DAO.OperatorPOJO;
import com.DBService.ConnectDB;

public class AdminManageOperation implements IAdminManageOperation {


	public OperatorPOJO[] getAllOperators() {
		// TODO Auto-generated method stub
		OperatorPOJO[] operatorList = null;
		try(Connection con = ConnectDB.getConnection()) {

			String sql = "select * from operator";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet result = pstmt.executeQuery();
			//Get row count by pointing to last row
			result.last();
			int row = result.getRow();
			result.beforeFirst();
			operatorList = new OperatorPOJO[row];

			for(int i=0;i<row;i++)
			{
				OperatorPOJO o = new OperatorPOJO();
				o.setOperatorId(result.getString("operator_id"));
				o.setOperatorUsername(result.getString("operator_username"));
				o.setOperatorName(result.getString("operator_name"));
				o.setOperatorDoj(result.getString("operator_doj"));
				o.setOperatorBranch(result.getString("operator_branch"));
				o.setOperatorStatus(result.getString("operator_status"));
				o.setOperatorEmail(result.getString("operator_email"));
				o.setOperatorPhone(result.getString("operator_phone"));

				operatorList[i] = o;


			}




		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage() );
		}

		return operatorList;
	}


	public boolean addOperator(Credentials auth, OperatorPOJO operatorInfo) {
		// TODO Auto-generated method stub

		boolean flag=false;

		try(Connection con = ConnectDB.getConnection()) {


			// SQL statement for insert into operator table
			String queryString="insert into operator("+
					"operator_username,operator_name,operator_password,operator_doj,operator_status,operator_branch,operator_phone,operator_email)"
					+"values(?,?,?,?,?,?,?,?)";
			//creating prepare statement using insert queryString
			PreparedStatement pstmt = con.prepareStatement(queryString);

			// setting values to prepare statements;
			pstmt.setString(1, auth.getUserName());
			pstmt.setString(2, operatorInfo.getOperatorName());
			pstmt.setString(3, auth.getUserPassword());
			pstmt.setString(4, operatorInfo.getOperatorDoj());
			pstmt.setString(5, operatorInfo.getOperatorStatus());
			pstmt.setString(6, operatorInfo.getOperatorBranch());
			pstmt.setString(7, operatorInfo.getOperatorPhone());
			pstmt.setString(8, operatorInfo.getOperatorEmail());


			// execute the query :Add new operator to table
			int affected_row = pstmt.executeUpdate();

			if(affected_row>0) {
				flag = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return flag;
	}


	public boolean removeOperator(String operatorUserName) {
		// TODO Auto-generated method stub


		return false;
	}


	public boolean updateOperatorStatus(String operatorUserName,String status) {
		// TODO Auto-generated method stub
		boolean flag = false;

		try(Connection con = ConnectDB.getConnection()) {
			
			String queryString="update operator set operator_status=? where operator_username=?";
			PreparedStatement pstmt = con.prepareStatement(queryString);
			pstmt.setString(1, status);
			pstmt.setString(2, operatorUserName);
			
			int affected_row = pstmt.executeUpdate();
			if(affected_row>0)
			{
				flag = true;
			}
			

		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return flag;
	}

	public boolean updateOperatorBranch(String operatorUserName,String branch) {
		// TODO Auto-generated method stub
		boolean flag = false;

		try(Connection con = ConnectDB.getConnection()) {
			
			String queryString="update operator set operator_branch=? where operator_username=?";
			PreparedStatement pstmt = con.prepareStatement(queryString);
			pstmt.setString(1, branch);
			pstmt.setString(2, operatorUserName);
			
			int affected_row = pstmt.executeUpdate();
			if(affected_row>0)
			{
				flag = true;
			}
			

		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return flag;

	}

	public OperatorPOJO getOperatorByUserName(String operatorUserName) {
		// TODO Auto-generated method stub
		return null;
	}

}
