/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DataBean;
import java.sql.*;
public class DoDB {
    Connection Cn;
    Statement St;
    ResultSet Rs;
    public DoDB(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String urlDB="jdbc:mysql://localhost:3306/testdb?"+"useUnicode=true&characterEncoding=gb2312";
            this.Cn=DriverManager.getConnection(urlDB,"root","root");
            this.St=this.Cn.createStatement();
            this.Rs=null;
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    public String doUpdate(String sql){
        try{
            this.St.executeUpdate(sql);
            return"";
        }catch(Exception ex){
            ex.printStackTrace();
            return ex.getMessage();
        }
    }
    public ResultSet doQuery(String sql){
        try{
            this.Rs=this.St.executeQuery(sql);
            if(Rs.next()){
                System.out.println("qweqweqweqweqwe");
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return this.Rs;
    }
    public void close(){
        try{
            if(!this.Rs.wasNull()){
                this.Rs.close();
                this.Rs=null;
            }
        if(!this.St.isClosed()){
            this.St.close();
            this.St=null;
        }
        if(!this.Cn.isClosed()){
            this.Cn.close();
            this.Cn=null;
        }
     }catch(Exception ex){
         ex.printStackTrace();
     }
    }
}
