<%--用来提前查询评论的jsp--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.getRequestDispatcher("/getComments").forward(request,response); %>
