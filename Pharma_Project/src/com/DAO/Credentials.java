package com.DAO;

public class Credentials {

	
	private String userName;
	private String userPassword;
	private String role;

	
	public Credentials(String userName, String userPassword, String role) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
		this.role = role;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String adminUserName) {
		this.userName = adminUserName;
	}


	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String adminPassword) {
		this.userPassword = adminPassword;
	}
	

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Credentials [userName=" + userName + ", userPassword=" + userPassword + ", role=" + role + "]";
	}

	
}
