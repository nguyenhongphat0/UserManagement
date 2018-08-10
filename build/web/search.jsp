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
        <p>Welcome <b><s:property value="#session.USER.fullName"></s:property></b>! <a href="login.jsp">Logout</a></p>
        <s:if test="#session.USER.roleID == 1">
            <a href="register.jsp">Create new user</a>
        </s:if>
        <s:form action="search" method="get">
            <s:textfield name="name" label="Search for name"></s:textfield>
            <s:hidden name="role" value="%{#request.role}"></s:hidden>
            <s:submit value="Search"></s:submit>
        </s:form>
        <s:form action="changeRole" theme="simple" method="get">
            <s:if test="#session.USER.roleID == 1">
                <s:select name="roleID" list="roleDAO.rolesList" listKey="roleID" listValue="'Change role to ' +roleName"></s:select>
                <s:hidden name="searchName" value="%{#request.name}"></s:hidden>
                <s:hidden name="searchRole" value="%{#request.role}"></s:hidden>
                <s:submit value="Change"></s:submit>
            </s:if>
            <div class="role-nav">
                <a id="role-0" class="role" href="search?role=0&name=<s:property value="#request.name"></s:property>">All (<s:property value="userDAO.usersList.size"></s:property>)</a>
                <s:iterator value="roleDAO.rolesList">
                    <a id="role-<s:property value="roleID"></s:property>" class="role" href="search?role=<s:property value="roleID"></s:property>&name=<s:property value="#request.name"></s:property>"><s:property value="roleName"></s:property> (<s:property value="count"></s:property>)</a>
                </s:iterator>
            </div>
            <script>
                function checkAll(self) {
                    var boxes = document.querySelectorAll('input[name=usernames]');
                    for (var i = 0; i < boxes.length; i++) {
                        boxes[i].checked = self.checked;
                    }
                }
            </script>
            <table border="1">
                <thead>
                    <tr>
                        <th><input name="usernames" type="checkbox" onclick="checkAll(this)"></th>
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
                                <td><s:checkbox name="usernames" fieldValue="%{username}"></s:checkbox></td>
                                <td><s:property value="username"></s:property></td>
                                <td><s:property value="fullName"></s:property></td>
                                <td><s:property value="email"></s:property></td>
                                <td><s:checkbox value="sendNotification" name="sendNotification" theme="simple"></s:checkbox></td>
                                <td><s:property value="roleDAO.getRoleName(roleID)"></s:property></td>
                            </tr>
                        </s:if>
                    </s:iterator>
                </tbody>
                <tfoot>
                    <tr>
                        <th><input name="usernames" type="checkbox" onclick="checkAll(this)"></th>
                        <th>Username</th>
                        <th>FullName</th>
                        <th>Email</th>
                        <th>Send Notification</th>
                        <th>Role</th>
                    </tr>
                </tfoot>
            </table>
        </s:form>
    </body>
</html>
