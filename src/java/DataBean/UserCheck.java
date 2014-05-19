/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DataBean;
public class UserCheck {
    String userName="";
    String userPassword="";
    boolean passed=false;
    public boolean isPassed(){
        return passed;
    }
    public void setPassed(boolean passed){
        this.passed=passed;
    }
    public String getUserName(){
        return userName;
    }
    public void setUserName(String userName){
        this.userName=userName;
    }
    public String getUserPassword(){
        return userPassword;
    }
    public void setUserPassword(String userPassword){
        this.userPassword=userPassword;
    }
    }

