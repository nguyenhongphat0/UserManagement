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
    public static final String SQLSELECT = "SELECT Username, FullName, Email, SendNotification, RoleID FROM Users ";
    private List<UserDTO> usersList;

    public List<UserDTO> getUsersList() {
        return usersList;
    }

    public void setUsersList(List<UserDTO> usersList) {
        this.usersList = usersList;
    }
    
    public UserDTO fromResultSet(ResultSet res) throws SQLException {
        String username = res.getString("Username");
        String fullName = res.getString("FullName");
        String email = res.getString("Email");
        boolean sendNotification = res.getBoolean("SendNotification");
        int roleID = res.getInt("RoleID");
        return new UserDTO(username, null, fullName, email, sendNotification, roleID);
    }
    
    public void listUsers(String name) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet res = null;
        try {
            String sql = SQLSELECT + "WHERE (Username LIKE ? OR FullName LIKE ?) ";
            con = DatabaseUtil.getConnection();
            pre = con.prepareStatement(sql);
            pre.setString(1, "%" + name + "%");
            pre.setString(2, "%" + name + "%");
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
    
    public UserDTO checkLogin(String username, String password) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet res = null;
        UserDTO user = null;
        try {
            String sql = SQLSELECT + "WHERE (Username = ? AND Password = ?) ";
            con = DatabaseUtil.getConnection();
            pre = con.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            res = pre.executeQuery();
            if (res.next()) {
                user = fromResultSet(res);
            }
        } finally {
            DatabaseUtil.closeConnection(con, pre, res);
        }
        return user;
    }
    
    public boolean changeRole(String username, int roleID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pre = null;
        try {
            String sql = "UPDATE Users SET roleID = ? WHERE Username = ?";
            con = DatabaseUtil.getConnection();
            pre = con.prepareStatement(sql);
            pre.setInt(1, roleID);
            pre.setString(2, username);
            return pre.executeUpdate() > 0;
        } finally {
            DatabaseUtil.closeConnection(con, pre);
        }
    }
}
