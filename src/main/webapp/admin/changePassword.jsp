
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
    <title>修改管理员密码</title>
    <%--   静态包含头部的js和css --%>
    <%@ include file="../common/head.jsp"%>
    <%--工程路径  http://localhost:8080/Blog/--%>
    <%
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        request.setAttribute("basePatch",basePath);
    %>
</head>
<body>

<h2  style="margin-bottom: 20px; margin-left: 50px; font-weight: 600;">修改密码</h2>
<form id="myform"  method="POST">
    <div class="form-group">
        <label for="userName">用户名</label>
        <input name="userName" type="text" value="${blogger.userName}" class="form-control" id="userName" placeholder="userName">
    </div>
    <div class="form-group">
        <label for="oldPassword">旧密码</label>
        <input name="oldPassword"  type="password" class="form-control" id="oldPassword">
    </div>

    <div class="form-group">
        <label for="newPassword">新密码</label>
        <input name="newPassword"  type="password" class="form-control" id="newPassword">
    </div>

    <div class="form-group">
        <label for="confirmNewPassword">确认新密码</label>
        <input name="confirmNewPassword"  type="password" class="form-control" id="confirmNewPassword">
    </div>

</form>

<button id="submit" type="submit" class="btn btn-info">提交</button>
<script>
    $(function () {
        $("#submit").click(function () {
            var userName = $("#userName").val();
            var oldPassword = $("#oldPassword").val();
            var newPassword = $("#newPassword").val();
            var confirmNewPassword = $("#confirmNewPassword").val();
            if (userName == '' || userName == undefined || userName == null){
                alert("用户名不能为空!");
            }else if (oldPassword == '' || oldPassword == undefined || oldPassword == null){
                alert("旧密码不能为空!");
            }else if (newPassword == '' || newPassword == undefined || newPassword == null){
                alert("新密码不能为空!");
            }else if(confirmNewPassword == '' || confirmNewPassword == undefined || confirmNewPassword == null){
                alert("还没有填写确认密码!");
            }else if(confirmNewPassword != newPassword){
                alert("两次输入的密码不相等!");
            }else if(newPassword.length < 6){
                alert("新密码长度必须大于等于6!")
            }
            else{


                $.ajax({
                    type: "POST",//方法类型
                    dataType: "text",//预期服务器返回的数据类型
                    url: "${basePatch}changePassword" ,//url
                    data: $('#myform').serialize(),
                    success: function (result) {
                        if (result == "SUCCESS") {
                            alert("密码修改成功")
                        }else {

                            alert(result);
                        }
                        ;
                    },
                })
            }
        })
    })

</script>
</body>
</html>
