/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts2;

import com.opensymphony.xwork2.ActionContext;
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
    @Result(type = "redirectAction", params = {
        "actionName", "search"
    }),
    @Result(name = "fail", location = "login.jsp")
})
public class LoginAction {
    private String username;
    private String password;
    private String message;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        UserDTO user = dao.checkLogin(username, password);
        if (user != null) {
            if (user.getFullName() == null) {
                user.setFullName("");
            }
            // Put logged user into session
            ActionContext.getContext().getSession().put("USER", user);
            // Create a RoleDAO instance and put it to aplication context to get roles directly from OGNL of jsp page
            ActionContext.getContext().getApplication().putIfAbsent("ROLER", new RoleDAO());
            return "success";
        } else {
            message = "Invalid username or password!";
            return "fail";
        }
    }
    
}
