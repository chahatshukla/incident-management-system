package com.company.dao;

public interface UserDao {
   boolean isValidUser(String username, String password);
    boolean addUser(User user);
    String getUserRole(String username, String password); 
}

