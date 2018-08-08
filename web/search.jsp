<%-- 
    Document   : search
    Created on : Aug 8, 2018, 11:23:00 PM
    Author     : nguyenhongphat0
--%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="tabs">
            <s:iterator value="roleDAO.rolesList">
                <a class="tab"><s:property value="roleName"></s:property> (<s:property value="count"></s:property>)</a>
            </s:iterator>
        </div>
        
        <table border="1">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>FullName</th>
                    <th>Email</th>
                    <th>Send Notification</th>
                    <th>Role</th>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="userDAO.usersList">
                    <tr>
                        <td><s:property value="username"></s:property></td>
                        <td><s:property value="fullName"></s:property></td>
                        <td><s:property value="email"></s:property></td>
                        <td><s:checkbox value="sendNotification" name="sendNotification" theme="simple"></s:checkbox></td>
                        <td><s:property value="roleDAO.getRoleName(roleID)"></s:property></td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>

    </body>
</html>
