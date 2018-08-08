/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.Serializable;

/**
 *
 * @author nguyenhongphat0
 */
public class UserDTO implements Serializable {
    private String username;
    private String password;
    private String fullName;
    private String email;
    private boolean sendNotification;
    private int roleID;

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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

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

    public UserDTO() {
    }

    public UserDTO(String username, String password, String fullName, String email, boolean sendNotification, int roleID) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.sendNotification = sendNotification;
        this.roleID = roleID;
    }
    
    
}
