<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <title>博客管理</title>
    <%--   静态包含头部的js和css --%>
    <%@ include file="../common/head.jsp"%>
    <%--工程路径  http://localhost:8080/Blog/--%>
    <%
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        request.setAttribute("basePatch",basePath);
    %>

</head>
<body>


<h2  style="margin-bottom: 20px; margin-left: 50px; font-weight: 600;">博客信息</h2>

<div class="contianer-fluid">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <th>id</th>
            <th>标题</th>
            <th>发布日期</th>
            <th>博客类别</th>
            <th>删除</th>
            <th>修改</th>
        </tr>
        <c:forEach items="${blogs}" var="blog">
            <tr>
                <td>${blog.id}</td>
                <td>${blog.title}</td>
                <td><fmt:formatDate value="${blog.releaseDate}" type="date" dateStyle="long"/></td>
                <td>${blog.blogType.typeName}</td>
                <td>
                    <a class="btn btn-danger delete" href="${basePatch}deleteBlog?id=${blog.id}">删除</a>
                </td>
                <td>
                    <a class="btn btn-warning" href="${basePatch}editBlog?id=${blog.id}">修改</a>
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