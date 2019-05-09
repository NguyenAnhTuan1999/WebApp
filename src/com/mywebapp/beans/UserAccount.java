package com.mywebapp.beans;

public class UserAccount {
    
   private String userName;
   private String password;
   private String displayName;

   public UserAccount() {
       
   }

   public UserAccount(String userName, String password, String displayName) {
      this.userName = userName;
      this.password = password;
      this.displayName = displayName;
   }

   public String getDisplayName() {
	   return displayName;
   }

   public void setDisplayName(String displayName) {
	   this.displayName = displayName;
   }
    
   public String getUserName() {
       return userName;
   }
 
   public void setUserName(String userName) {
       this.userName = userName;
   }
 
   public String getPassword() {
       return password;
   }
 
   public void setPassword(String password) {
       this.password = password;
   }
}
