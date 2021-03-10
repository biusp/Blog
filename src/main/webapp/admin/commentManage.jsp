<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 判断用户是否登录 --%>
<%
    if(session.getAttribute("blogger") == null){
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }

%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>评论管理</title>
    <%--   静态包含头部的js和css --%>
    <%@ include file="../common/head.jsp"%>
    <%--工程路径  http://localhost:8080/Blog/--%>
    <%
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        request.setAttribute("basePatch",basePath);
    %>

</head>
<body>

<h2  style="margin-bottom: 20px; margin-left: 50px; font-weight: 600;">评论管理</h2>

<div class="contianer-fluid">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <th>id</th>
            <th>博客标题</th>
            <th>用户IP</th>
            <th>评论内容</th>
            <th>评论日期</th>
            <th>评论状态</th>
            <th>删除</th>

        </tr>
        <c:forEach items="${comments}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.blog.title}</td>
                <td>${comment.userIp}</td>
                <td>${comment.content}</td>
                <td><fmt:formatDate value="${comment.commentDate}" type="date" dateStyle="long"/></td>
                <td>${comment.state == 0?"未审核":comment.state == 1?"通过":"未通过"}</td>
                <td>
                    <a class="btn btn-danger delete" href="${basePatch}deleteComment?id=${comment.id}">删除</a>
                </td>
            </tr>
        </c:forEach>

    </table>



</div>

<script>

    $(function(){

    //删除提示
            $(".delete").click(function() {
                if(confirm("确认删除么?")){
                    return true;
                }else{
                    return false;
                }
            })
    })



</script>

</body>
</html>