<%-- 
    Document   : register
    Created on : Aug 10, 2018, 10:34:47 AM
    Author     : nguyenhongphat0
--%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new user</title>
        <s:head></s:head>
    </head>
    <body>
        <h1>Create new user</h1>
        <s:property escape="false" value="message"></s:property>
        <s:form action="register">
            <s:textfield name="username" label="Username"></s:textfield>
            <s:password name="password" label="Password"></s:password>
            <s:password name="confirmPassword" label="Confirm password"></s:password>
            <s:textfield name="fullName" label="FullName"></s:textfield>
            <s:textfield name="email" label="Email"></s:textfield>
            <s:checkbox name="sendNotification" label="Send notify"></s:checkbox>
            <s:select name="roleID" label="Role" list="#application.ROLER.listRoles()" listKey="roleID" listValue="roleName"></s:select>
            <s:submit value="Register this user"></s:submit>
        </s:form>
        <a href="search">Back</a>
    </body>
</html>
