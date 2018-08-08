/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts2;

import java.util.List;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;
import role.RoleDAO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author nguyenhongphat0
 */
@ResultPath("/")
@Results({
    @Result(location = "search.jsp")
})
public class SearchAction {
    private UserDAO userDAO;
    private RoleDAO roleDAO;
    private String name;
    private int role;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
    public UserDAO getUserDAO() {
        return userDAO;
    }

    public RoleDAO getRoleDAO() {
        return roleDAO;
    }
    
    public String execute() throws Exception {
        this.userDAO = new UserDAO();
        this.roleDAO = new RoleDAO();
        userDAO.listUsers(name);
        roleDAO.listRoles();
        roleDAO.countUserInRole(userDAO.getUsersList());
        return "success";
    }
    
}
