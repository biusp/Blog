<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>管理个人信息</title>
    <%--   静态包含头部的js和css --%>
    <%@ include file="../common/head.jsp"%>
    <%--工程路径  http://localhost:8080/Blog/--%>
    <%
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        request.setAttribute("basePatch",basePath);
    %>

</head>
<body>


<h2  style="margin-bottom: 20px; margin-left: 50px; font-weight: 600;">个人信息管理</h2>

<div class="contianer-fluid">


    <%--修改个人信息的表单--%>
    <form id="myform" method="POST">
        <div class="form-group">
            <label for="userName">登陆名</label>
            <p id="error" style="color: red"></p>
            <input name="userName" type="text" value="${blogger.userName}" class="form-control" id="userName"  onblur="onInputBlur(this)">
        </div>
        <div class="form-group">
            <label for="nickName">昵称</label>
            <input name="nickName" type="text" value="${blogger.nickName}" class="form-control" id="nickName" >
        </div>

        <div class="form-group">
            <label for="sign">个性签名</label>
            <textarea name="sign" id="sign" >${blogger.sign}</textarea>
        </div>

        <div class="form-group">
            <label for="profile">简介</label>
            <textarea name="profile" id="profile" value="${blogger.profile}"></textarea>
        </div>
        <input type="hidden" value="1">

        <button type="submit" class="btn btn-default">提交</button>

    </form>







</div>

<script>

    $(function(){

        //手动提交表单
        $("#submit").click(function(){
            var userName = $("#userName").val();
            var nickName = $("#nickName").val();
            var sign = $("#sign").val();
            var profile = $("#profile").html();
            if (userName == '' || userName == undefined || userName == null){
                alert("登陆名不能为空!");
            }else if (nickName == '' || nickName == undefined || nickName == null){
                alert("昵称不能为空!");
            }else if (sign == '' || sign == undefined || sign == null){
                alert("个性签名不能为空!");
            }else if(profile == '' || profile == undefined || profile == null){
                alert("简介不能为空!");
            }else if($("#error").val() == "该登陆名已经存在!请重新输入"){
                alert("请重新输入登陆名!");
            }
            else{
                $.ajax({
                    type: 'get',
                    url: "${basePatch}updateBlogger",
                    data: $("#myform").serialize(),
                    datatype: 'text',
                    success: function (data) {

                        if (data == "true") {
                            alert("修改成功!");
                        } else {
                            alert(data);
                        }
                    }
                });
                alert("提交成功!");
                return false;
            }


        })



    })



    //当input失去焦点后
    function onInputBlur() {
        var userName = $("#userName").val();
        var error = $("#error");
        $.ajax({
            type: 'get',
            url: "${basePatch}ajaxUserNameExist",
            data: { "userName": userName},
            datatype: 'text',
            success: function (data) {

                if (data == "true") {
                    error.html("该登陆名已经存在!请重新输入");
                } else {
                    error.html("");

                }
            }
        });
    }
</script>

</body>
</html>