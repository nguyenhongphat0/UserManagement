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
        <title>Search Page</title>
        <style>
            .role {
                text-decoration: none;
                color: black;
            }
                
            #role-<s:property value="#request.role"></s:property> {
                color: blue;
            }
        </style>
    </head>
    <body>
        <s:form action="search">
            <s:textfield name="name" label="Search for name"></s:textfield>
            <s:hidden name="role" value="%{#request.role}"></s:hidden>
            <s:submit value="Search"></s:submit>
        </s:form>
        
        <div class="role-nav">
            <a id="role-0" class="role" href="search?role=0&name=<s:property value="#request.name"></s:property>">All (<s:property value="userDAO.usersList.size"></s:property>)</a>
            <s:iterator value="roleDAO.rolesList">
                <a id="role-<s:property value="roleID"></s:property>" class="role" href="search?role=<s:property value="roleID"></s:property>&name=<s:property value="#request.name"></s:property>"><s:property value="roleName"></s:property> (<s:property value="count"></s:property>)</a>
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
                    <s:if test="roleID == #request.role || #request.role == 0">
                        <tr>
                            <td><s:property value="username"></s:property></td>
                            <td><s:property value="fullName"></s:property></td>
                            <td><s:property value="email"></s:property></td>
                            <td><s:checkbox value="sendNotification" name="sendNotification" theme="simple"></s:checkbox></td>
                            <td><s:property value="roleDAO.getRoleName(roleID)"></s:property></td>
                        </tr>
                    </s:if>
                </s:iterator>
            </tbody>
        </table>

    </body>
</html>
