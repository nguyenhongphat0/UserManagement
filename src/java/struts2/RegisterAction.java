/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts2;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.FieldExpressionValidator;
import com.opensymphony.xwork2.validator.annotations.RegexFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import java.sql.SQLException;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author nguyenhongphat0
 */
@ResultPath("/")
@Results({
    @Result(location = "register.jsp")
})
public class RegisterAction extends ActionSupport {
    private String username;
    private String password;
    private String confirmPassword;
    private String fullName;
    private String email;
    private boolean sendNotification;
    private int roleID;
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUsername() {
        return username;
    }

    @RequiredStringValidator(trim = true, message = "Username must not be empty")
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }
    
    @RequiredStringValidator(trim = true, message = "Password must not be empty")
    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    @FieldExpressionValidator(expression = "confirmPassword == password", message = "Confirm password not match")
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    @RegexFieldValidator(regex = ".+@.+\\..+", message = "Email must be someone@domain.com")
    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isSendNotification() {
        return sendNotification;
    }

    public void setSendNotification(boolean sendNotification) {
        this.sendNotification = sendNotification;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
    
    public String execute() throws Exception {
        UserDTO user = new UserDTO(username, password, fullName, email, sendNotification, roleID);
        UserDAO dao = new UserDAO();
        try {
            if (dao.register(user)) {
                this.message = "<b style='color: green'>User " + username + " registered successfully!</b>";
            } else {
                this.message = "<b style='color: red'>Error insert user " + username + " into database!</b>";
            }
        } catch (SQLException e) {
            if (e.getMessage().contains("duplicate")) {
                this.message = "<b style='color: red'>Username existed! Try another</b>";
            } else {
                throw  e;
            }
        }
        return "success";
    }
    
}
