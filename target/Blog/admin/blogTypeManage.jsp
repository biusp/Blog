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
    <title>博客类型管理</title>
    <%--   静态包含头部的js和css --%>
    <%@ include file="../common/head.jsp"%>
    <%--工程路径  http://localhost:8080/Blog/--%>
    <%
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        request.setAttribute("basePatch",basePath);
    %>

</head>
<body>


<h2  style="margin-bottom: 20px; margin-left: 50px; font-weight: 600;">博客类别</h2>

<div class="contianer-fluid">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <th>id</th>
            <th>类型名称</th>
            <th>排序序号</th>
            <th>删除</th>
            <th>修改</th>
        </tr>
        <c:forEach items="${sessionScope.blogTypes}" var="type">
            <tr>
                <td>${type.id}</td>
                <td>${type.typeName}</td>
                <td>${type.orderNo}</td>
                <td>
                    <a class="btn btn-danger delete" href="${basePatch}deleteBlogType?id=${type.id}">删除</a>
                </td>
                <td>
                    <a class="btn btn-warning" href="${basePatch}editBlogType?id=${type.id}">修改</a>
                </td>
            </tr>
        </c:forEach>

    </table>


    <a id="add" class="btn btn-info" href="">添加类别</a>








    <!-- 添加类别的模态框 -->
    <div id="myModal" class="modal fade"  tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加类别</h4>
                </div>
                <div class="modal-body">

                    <!-- 模态框主体内容 -->

                    <form action="${basePatch}addBlogType" method="POST">
                        <div class="form-group">
                            <label for="ID">ID</label>
                            <p><span id="error" style="color: red"></span></p>
                            <input name="id" type="text" class="form-control" id="id" placeholder="ID" onblur="onInputBlur(this)">
                        </div>
                        <div class="form-group">
                            <label for="type">类型</label>
                            <input name="typeName" type="text" class="form-control" id="type" placeholder="类型名称">
                        </div>

                        <div class="form-group">
                            <label for="orderNo">排序序号</label>
                            <input name="orderNo" type="text" class="form-control" id="orderNo" placeholder="排序序号">
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" id="submit" class="btn btn-primary" >提交</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->













</div>

<script>

    $(function(){
        //    为提交按钮绑定模态框
        $("#add").click(function(){
            $('#myModal').modal("show");
            return false;
        });

        //手动提交表单
        $("#submit").click(function(){
            var id = $("#id").val();
            var type = $("#type").val();
            var orderNo = $("#orderNo").val();
            var errorText = $("#error").html();
            if (id == '' || id == undefined || id == null){
                alert("id不能为空!");
            }else if (type == '' || type == undefined || type == null){
                alert("类型不能为空!");
            }else if (orderNo == '' || orderNo == undefined || orderNo == null){
                alert("排序序号不能为空!");
            }else if(errorText == "该id已经存在!请重新输入"){
                alert("请修改id!");
            } else{
                $("form").submit();
                alert("提交成功!");
                $('#myModal').modal("toggle");
            }


        })

    //删除提示
            $(".delete").click(function() {
                if(confirm("确认删除么?")){
                    return true;
                }else{
                    return false;
                }
            })

            if("${inUse}" == "true"){
                alert("删除失败,该博客类型已被使用!")
            }

    })



    //当input失去焦点后
    function onInputBlur() {
        const val = $("#id").val();
        const error = $("#error");
        $.ajax({
            type: 'get',
            url: "${basePatch}ajaxIdExist",
            data: { "id": val},
            datatype: 'text',
            success: function (data) {

                if (data == "true") {
                    error.html("该id已经存在!请重新输入");
                } else {
                    error.html("");
                }
            }
        });
    }
</script>

</body>
</html>