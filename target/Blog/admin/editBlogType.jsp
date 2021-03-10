
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 判断用户是否登录 --%>
<%
    if(session.getAttribute("blogger") == null){
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }

%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑博客类型</title>
    <%--   静态包含头部的js和css --%>
    <%@ include file="../common/head.jsp"%>
    <%--工程路径  http://localhost:8080/Blog/--%>
    <%
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        request.setAttribute("basePatch",basePath);
    %>
</head>
<body>

<h2  style="margin-bottom: 20px; margin-left: 50px; font-weight: 600;">编辑博客类型</h2>
<form  action="${basePatch}updateBlogType" method="POST">
    <div class="form-group">
        <label for="ID">ID</label>
        <input name="id" readonly="readonly"  type="text" value="${type.id}" class="form-control" id="id" placeholder="ID">
    </div>
    <div class="form-group">
        <label for="type">类型</label>
        <input name="typeName" value="${type.typeName}" type="text" class="form-control" id="type" placeholder="类型名称">
    </div>

    <div class="form-group">
        <label for="orderNo">排序序号</label>
        <input name="orderNo" value="${type.orderNo}" type="text" class="form-control" id="orderNo" placeholder="排序序号">
    </div>

</form>

<button id="submit" type="submit" class="btn btn-info">提交</button>
<script>
    $(function () {
        $("#submit").click(function () {
            var id = $("#id").val();
            var type = $("#type").val();
            var orderNo = $("#orderNo").val();
            if (id == '' || id == undefined || id == null){
                alert("id不能为空!");
            }else if (type == '' || type == undefined || type == null){
                alert("类型不能为空!");
            }else if (orderNo == '' || orderNo == undefined || orderNo == null){
                alert("排序序号不能为空!");
            }else{
                $("form").submit();
                alert("提交成功!");
            }
        })
    })

</script>
</body>
</html>
