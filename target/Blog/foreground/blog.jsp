<%@ page import="com.blog.pojo.Blog" %>
<%@ page import="org.springframework.web.context.request.RequestScope" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <title>biuspの博客</title>
    <%--   静态包含头部的js和css --%>
    <%@ include file="../common/head.jsp"%>
    <%--工程路径  http://localhost:8080/Blog/--%>
    <%
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        request.setAttribute("basePatch",basePath);
    %>
    <link rel="stylesheet" href="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/css/editormd.min.css">
    <link rel="stylesheet" href="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/css/editormd.css">
    <script src="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/editormd.min.js"></script>
    <script src="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/lib/marked.min.js"></script>
    <script src="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/lib/prettify.min.js"></script>
    <script src="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/lib/raphael.min.js"></script>
    <script src="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/lib/underscore.min.js"></script>
    <script src="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/lib/sequence-diagram.min.js"></script>
    <script src="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/lib/flowchart.min.js"></script>
    <script src="https://blog-1303029870.cos.ap-nanjing.myqcloud.com/editor.md/lib/jquery.flowchart.min.js"></script>
    <style>
        body{
            overflow-x:hidden;
            font-family: TIBch,"Classic Grotesque W01","Helvetica Neue",Arial,"Hiragino Sans GB",STHeiti,"Microsoft YaHei","WenQuanYi Micro Hei",SimSun,sans-serif;
        }
        #nav{
            font-size: 16px;
        }
        #list{
            margin-right: 10%;
        }
        #list li{
            margin-right: 15px;
        }
        h1{
            font-size: 23px;
            font-weight: 600;
            color: #444;
        }
        p{
            line-height: 1.77;
            font-size: 15px;
        }
        #sidebar li{
            list-style: none;
            margin-bottom: 10px ;
        }
        #sidebar li a{
            text-decoration: none;
        }

        #sidebar li a:link {
            color: #6e7173;
        }
        #sidebar li a:visited {
            color: #6e7173;
        }
        #sidebar li a:hover {
            color: #6e7173;
        }

        .blog_warpper{
            margin-bottom: 80px;
            padding: 0 0 0 20px;
        }
        #content>*{
            padding: 0;
        }

    </style>

</head>
<body>
<!-- 导航条 -->
<%@include file="../common/top_navigation.jsp"%>

<div class="contaniner-fluid center-block" style="margin-top: 100px;">
    <div class="row" style="width: 100%;">
        <!-- 天气插件的容器 -->
        <div id="weather" class="col-sm-3 hidden-sm hidden-md" style="padding-left: 50px;">
            <div class="center-block hidden-xs hidden-sm">
                <iframe width="280" height="300" frameborder="0" scrolling="no" hspace="0" src="https://i.tianqi.com/?c=code&a=getcode&id=55&icon=1"></iframe>
            </div>

        </div>
        
        <!-- 布局容器  -->
        <div class="col-sm-2  hidden-lg "></div>

        <div class="col-sm-6" style="padding-right: 0" >
            <!-- 博客内容的容器 -->
            <div class="blog_warpper" style="border-bottom: 1px #9e9797 solid; padding-bottom: 50px">
                <h1>${blog.title}</h1>
                <samil> <span class=" glyphicon glyphicon-time"></span> <fmt:formatDate value="${blog.releaseDate}" type="date" dateStyle="long"/> </samil>
                <span> | </span>
                <small> <span class=" glyphicon glyphicon-tags"></span> &nbsp; ${blog.blogType.typeName}</small>


                <!-- 博客内容 -->
                <div id="content" >
                    <div id="test-editormd">
                        <textarea style="display: none" name="test-editormd-markdown-doc">${blog.content}</textarea>
                    </div>
                </div>


                <a class="btn btn-default pull-right" href="${basePatch}"> <span class="glyphicon glyphicon-share-alt"></span> 返回</a>

            </div>






            <%--评论列表--%>
            <a id="add" class="btn btn-default pull-right" style="" href="">回复</a>
            <h3 style="font-weight: 600; border-bottom: 2px #9e9797 solid;padding-bottom: 10px; padding-top: 10px; padding-left: 10px;">留言板 <small class="badge">${comments.size()}</small></h3>

            <div class="comments" style=" padding-left: 10px">

                <c:forEach items="${comments}" var="comment">


                    <%--具体评论--%>
                    <div class="comment" style="margin-top: 20px;">
                            <%--       头像         --%>
                        <img style="margin-top: 20px" height="44px" width="44px" src="https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1963304009,2816364381&fm=26&gp=0.jpg"  class="pull-left img-circle">
                            <%--        回复区域           --%>
                        <div style="background-color: #f0f2fa; margin-left: 60px">
                                <%-- 评论内容--%>
                            <p style="padding:20px 20px 0 20px;">${comment.content}</p>

                            <small style="padding-left:20px; color: #6e7173;"><fmt:formatDate value="${comment.commentDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></small>

                            <small style="padding-right:20px; color: #6e7173; float: right;">评论IP: <span>${comment.userIp}</span></small>
                        </div>

                    </div>


                </c:forEach>





            </div>




        </div>




        <!-- 右边导航条 -->

        <%@include file="../common/right _navigation.jsp"%>


    </div>

<%-- 页脚信息--%>
    <%@include file="../common/footer.jsp"%>










    <!-- 留言的模态框 -->
    <div id="myModal" class="modal fade"  tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">留言</h4>
                </div>
                <div class="modal-body">

                    <!-- 模态框主体内容 -->

                    <form id="myform" method="POST">

                        <div class="form-group">
                            <label for="comment">内容</label>
                            <input name="content" type="text" class="form-control" id="comment" placeholder="请说点什么吧!">
                            <input type='text' style='display:none'/>
                        </div>

                        <div class="form-group">
<%--                            获取回复的ip--%>
                            <%  request.setAttribute("ip",request.getRemoteAddr()); %>
                            <input type="hidden" name="blogId" value="${blog.id}">
                            <input type="hidden" name="userIp" value="${requestScope.ip}">
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



<script type="text/javascript">
    $(function(){
        //解析md文档的函数
            var testEditor = editormd.markdownToHTML("test-editormd", {
            htmlDecode :"style, script, iframe",
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
        });



        var weather =  $("#weather");
        var sidebar = $("#sidebar");
        $(window).scroll(function(){//开始监听滚动条

            //获取当前滚动条高度

            var topp = $(document).scrollTop();
            // 让天气跟随滚动条移动
            if($(document).width()>=992){
                weather.css("marginTop", topp);
            }
            //让右侧导航跟随滚动条移动
            if($(document).width()>=768){
                sidebar.css("marginTop",50 + topp);

            }


        })



        //    为提交按钮绑定模态框
        $("#add").click(function(){
            $('#myModal').modal("show");
            return false;
        });

        //ajax提交表单
        $("#submit").click(function(){
            var comment = $("#comment").val();
            if (comment == '' || comment == undefined || comment == null){
                alert("留言不能为空!");
            }else{
                $.ajax({
                    type: "POST",//方法类型
                    dataType: "text",//预期服务器返回的数据类型
                    url: "${basePatch}addCommentAjax" ,//url
                    data: $('#myform').serialize(),
                    success: function (result) {
                        console.log(result);//打印服务端返回的数据(调试用)
                        if (result == "SUCCESS") {
                            $('#myModal').modal("toggle");
                            alert("提交成功,请等待管理员审核评论后才可查看!");
                        }else {
                            $('#myModal').modal("toggle");
                            alert("服务器错误!请尝试重新提交");
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