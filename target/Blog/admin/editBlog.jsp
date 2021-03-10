<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <link rel="stylesheet" href="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/css/editormd.css">
    <script src="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/editormd.min.js"></script>
</head>
<body>

<h2  style="margin-bottom: 20px; margin-left: 50px; font-weight: 600;">修改博客</h2>
<form action="${basePatch}updateBlog" method="POST">
    <div class="form-group">
        <label for="title">标题</label>
        <input name="title" value="${blog.title}" type="text" class="form-control" id="title" placeholder="">
    </div>
    <div class="form-group">
        <label for="typeId">博客类型</label>
        <select name="typeId" id="typeId" class="form-control">
            <c:forEach items="${blogTypes}" var="type">
                <option value="${type.id}">${type.typeName}</option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
        <label for="summary">博客摘要</label>
        <textarea name="summary"  id="summary" class="form-control" rows="3">${blog.summary}</textarea>
    </div>

    <div class="form-group">
        <label >博客内容</label>
        <div id="editormd">
            <textarea  style="display:none;" name="content">${blog.content}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="keyword">关键字</label>
        <input name="keyword" value="${blog.keyword}" type="text" class="form-control" id="keyword" placeholder="用于搜索,可不填写">
    </div>
    <div class="form-group">
        <input type="hidden" name="id" value="${blog.id}">
    </div>
</form>

<button id="submit" type="submit" class="btn btn-info">提交</button>

<script>
    $(function () {
            var editor = editormd("editormd", {
                placeholder:'编辑器支持Markdown语法，右边预览',  //默认显示的文字，这里就不解释了
                width: "90%",
                height: 640,
                syncScrolling: "single",
                path: "https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/lib/",
                //这个配置在simple.html中并没有，但是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
                saveHTMLToTextarea: true,

                imageUpload: true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "/uploadImage",//注意你后端的上传图片服务地址
                onload: function(){
                    this.width("100%");
                    this.height(480);
                }
            });




        //手动提交表单
        $("#submit").click(function(){
            var content = editor.getMarkdown();
            var title = $("#title").val();
            var typeId = $("#typeId").val();
            var summary = $("#summary").val();
            if (title == '' || title == undefined || title == null){
                alert("标题不能为空!");
            }else if (typeId == '' || typeId == undefined || typeId == null){
                alert("博客类型不能为空!");
            }else if (content == '' || content == undefined || content == null){
                alert("博客内容不能为空!");
            }else if (summary == '' || summary == undefined || summary == null){
                alert("博客摘要不能为空!");
            }else{
                $("form").submit();
                alert("提交成功!");
            }


        })
    })

</script>
</body>
</html>
