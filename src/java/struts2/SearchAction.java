/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts2;

import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
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
        if (name == null) {
            name = "";
        }
        this.userDAO = new UserDAO();
        this.roleDAO = new RoleDAO();
        UserDTO logged = (UserDTO) ActionContext.getContext().getSession().get("USER");
        if (logged.getRoleID() == 1) {
            // this user is admin, query the database to get users
            userDAO.listUsers(name);
        } else {
            // this user is not admin, he can only find himselft in the search result
            // so we put the user in session to the result instead of query the database
            if (logged.getUsername().contains(name) || logged.getFullName().contains(name)) {
                List<UserDTO> res = new ArrayList<>();
                res.add(logged);
                userDAO.setUsersList(res);
            }
        }
        // query the database to get roles
        roleDAO.listRoles();
        // count how many users in each roles
        roleDAO.countUserInRole(userDAO.getUsersList());
        return "success";
    }
    
}
