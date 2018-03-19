package com.DAO.login;
import java.sql.*;
import com.DAO.Credentials;
import com.dbutils.ConnectDB;
public class Login implements ILogin{

	@Override
	public boolean validateUser(Credentials user) {
		boolean result = false;
		String userName = user.getUserName();
		String userPassword = user.getUserPassword();
		try (Connection con = ConnectDB.getConnection()){
			String sqlQuery;
			if(user.getRole())
			{//role is true for admin
				sqlQuery="select admin_name,admin_password from admin where admin_username=? and admin_password=?";
			}
			else
			{
				sqlQuery="select operator_name,operator_password from operator where operator_username=? and operator_password=?";
			}
			PreparedStatement pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1,userName);
			pstmt.setString(2, userPassword);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next() )
			{
				//If row exit valid credentials
				result = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return result;
	}
	
}
