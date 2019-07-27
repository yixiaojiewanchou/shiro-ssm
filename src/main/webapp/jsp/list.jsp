<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/16
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>list</title>
</head>
<body>
<div>
    <h1>list</h1>

    <%--用户没有身份验证时显示相应信息，即游客访问信息。--%>
    <shiro:guest>
        欢迎游客访问，<a href="/login">登录</a>
    </shiro:guest>

    <%--用户登录后显示的内容--%>
    <shiro:user>
        <%--用于显示用户信息--%>
        <shiro:principal property="username">
            用户[ <shiro:principal/> ]已身份验证通过
        </shiro:principal>
        <br><br>
        <a href="/logout">注销</a>
        <br><br>

        <%--是否拥有该角色--%>
        <shiro:hasRole name="user">
            <a href="/user">User</a>
        </shiro:hasRole>
        <br><br>
        <shiro:hasRole name="admin">
            <a href="/admin">Admin</a>
        </shiro:hasRole>

        <%--shiro没有该角色时显示的内容--%>
        <shiro:lacksRole name="admin">
            <p style="color: red;">该用户没有admin角色</p>
        </shiro:lacksRole>

        <%--如果有任意一个角色将显示--%>
        <shiro:hasAnyRoles name="user,admin">
            <p style="color: yellow">该用户有user或admin中任意一个角色</p>
        </shiro:hasAnyRoles>
    </shiro:user>

    <%--定义一组操作用于判断是否有权限--%>
    <shiro:hasRole name="user">
        <a href="/addUser">新增用户</a>
        <br>
    </shiro:hasRole>
    <shiro:hasRole name="admin">
        <a href="/updateUser">修改用户</a>
        <br>
    </shiro:hasRole>
    <shiro:hasRole name="admin">
        <a href="/delUser">删除用户</a>
        <br>
    </shiro:hasRole>



    <shiro:hasPermission name="test:add">
        <a href="/addUser">新增用户</a>
        <br>
    </shiro:hasPermission>
    <shiro:hasPermission name="test:update">
        <a href="/updateUser">修改用户</a>
        <br>
    </shiro:hasPermission>
    <shiro:hasPermission name="test:delete">
        <a href="/delUser">删除用户</a>
        <br>
    </shiro:hasPermission>




    <%--<a href="/updateUser">修改用户</a>--%>
    <%--<br>--%>
    <%--<a href="/addUser">新增用户</a>--%>
    <%--<br>--%>
    <%--<a href="/delUser">删除用户</a>--%>
    <%--<br>--%>
</div>
</body>
</html>
