package com.nagarro.services;

public class UserService {
	public boolean authenticate(String user, String pass) {
		if(user.length()<5 || pass.length()<5) {
			return false;
		}
		return true;
	}
}
