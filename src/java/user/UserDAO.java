/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DatabaseUtil;

/**
 *
 * @author nguyenhongphat0
 */
public class UserDAO implements Serializable {
    public static final String SQLSELECT = "SELECT Username, Password, FullName, Email, SendNotification, RoleID FROM Users ";
    public static final String SQLSELECTNOPASSWORD = "SELECT Username, FullName, Email, SendNotification, RoleID FROM Users ";
    private List<UserDTO> usersList;

    public List<UserDTO> getUsersList() {
        return usersList;
    }
    
    public UserDTO fromResultSet(ResultSet res) throws SQLException {
        String username = res.getString("Username");
        String fullName = res.getString("FullName");
        String email = res.getString("Email");
        boolean sendNotification = res.getBoolean("SendNotification");
        int roleID = res.getInt("RoleID");
        return new UserDTO(username, null, fullName, email, sendNotification, roleID);
    }
    
    public void listUsers(String name, int roleID) throws NamingException, SQLException {
        if (name == null) {
            name = "";
        }
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet res = null;
        try {
            String sql = SQLSELECTNOPASSWORD + "WHERE (Username LIKE ? OR FullName LIKE ?) ";
            if (roleID != 0) {
                sql += "AND RoleID = ?";
            }
            con = DatabaseUtil.getConnection();
            pre = con.prepareStatement(sql);
            pre.setString(1, "%" + name + "%");
            pre.setString(2, "%" + name + "%");
            if (roleID != 0) {
                pre.setInt(3, roleID);
            }
            res = pre.executeQuery();
            while (res.next()) {                
                if (this.usersList == null) {
                    this.usersList = new ArrayList<>();
                }
                usersList.add(fromResultSet(res));
            }
        } finally {
            DatabaseUtil.closeConnection(con, pre, res);
        }
    }
}
