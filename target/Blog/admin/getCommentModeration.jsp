<%--用来提前查询需要审核评论的jsp--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.getRequestDispatcher("/getCommentModeration").forward(request,response); %>
