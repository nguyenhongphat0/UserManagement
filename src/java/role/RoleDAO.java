/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package role;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import user.UserDTO;
import utils.DatabaseUtil;

/**
 *
 * @author nguyenhongphat0
 */
public class RoleDAO implements Serializable {
    private List<RoleDTO> rolesList;
    
    public RoleDTO fromResultSet(ResultSet res) throws SQLException {
        int roleID = res.getInt("RoleID");
        String roleName = res.getString("RoleName");
        return new RoleDTO(roleID, roleName);
    }

    public List<RoleDTO> getRolesList() {
        return rolesList;
    }
    
    public List<RoleDTO> listRoles() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet res = null;
        try {
            String sql = "SELECT RoleID, RoleName FROM Roles";
            con = DatabaseUtil.getConnection();
            pre = con.prepareStatement(sql);
            res = pre.executeQuery();
            if (this.rolesList == null) {
                this.rolesList = new ArrayList<>();
            } else {
                this.rolesList.clear();
            }
            while (res.next()) {
                rolesList.add(fromResultSet(res));
            }
        } finally {
            DatabaseUtil.closeConnection(con, pre, res);
        }
        return this.rolesList;
    }
    
    public void countUserInRole(List<UserDTO> usersList) {
        if (usersList == null) {
            return;
        }
        for (RoleDTO role : rolesList) {
            for (UserDTO user : usersList) {
                if (user.getRoleID() == role.getRoleID()) {
                    role.setCount(role.getCount() + 1);
                }
            }
        }
    }
    
    public String getRoleName(int roleID) {
        for (RoleDTO role : rolesList) {
            if (role.getRoleID() == roleID) {
                return role.getRoleName();
            }
        }
        return "";
    }
}
