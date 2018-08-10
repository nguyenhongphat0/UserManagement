<%-- 
    Document   : login
    Created on : Aug 9, 2018, 4:20:02 PM
    Author     : nguyenhongphat0
--%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <s:if test="%{message != null}">
            <p style="color: red"><s:property value="message"></s:property></p>
        </s:if>
        <s:else>
            <p>Enter your username and password to login</p>
        </s:else>
        <s:form action="login">
            <s:textfield name="username" label="Username"></s:textfield>
            <s:password name="password" label="Password"></s:password>
            <s:submit value="Login"></s:submit>
        </s:form>
    </body>
</html>
