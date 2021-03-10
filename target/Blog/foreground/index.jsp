<%@ page import="java.util.List" %>
<%@ page import="com.blog.pojo.Blog" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
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
        #homepage{
            color: #333;
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
        
        .summary{
            margin-bottom: 80px;
            padding: 0 0 0 20px ;
        }
        #pages{
            width: 231px;
            margin: 0 auto;
        }
        

        
    </style>

</head>
<body>
    <!-- 导航条 -->
    <%@include file="../common/top_navigation.jsp"%>

<div class="contaniner-fluid center-block" style="margin-top: 100px;">
    <div class="row" style="width: 100%;">
        <!-- 天气插件的容器 -->
        <div id="weather" class="col-sm-3 hidden-sm hidden-md">
            <div class="center-block hidden-xs hidden-sm" style="padding-left: 50px;">
            <iframe width="280" height="300" frameborder="0" scrolling="no" hspace="0" src="https://i.tianqi.com/?c=code&a=getcode&id=55&icon=1"></iframe>
            </div>

        </div>

        <%--   布局 xs sm 时显示   --%>
        <div class="col-sm-2  hidden-lg " >

        </div>

        <!-- 博客摘要的容器 -->
        <div class="col-sm-5 " >
            <!-- 博客摘要 -->
            <c:forEach items="${blogs}" var="blog">

                <div class="summary" >
                    <h1>${blog.title}</h1>
                    <samil> <span class=" glyphicon glyphicon-time"></span> <fmt:formatDate value="${blog.releaseDate}" type="date" dateStyle="long"/> </samil>
                    <span> | </span>
                    <small> <span class=" glyphicon glyphicon-tags"></span> &nbsp;${blog.blogType.typeName}</small>
                    <p style="margin-top: 20px;">${blog.summary}</p>
                    <a href="${basePatch}getBlog?id=${blog.id}" class=" btn btn-default pull-right">阅读全文 <smail >>></smail> </a>
                </div>

            </c:forEach>



        </div>


        

        <!-- 用来布局的  -->
<%--        <div class="col-sm-1"></div>--%>


        <!-- 右边导航条 -->

        <%@include file="../common/right _navigation.jsp"%>




    </div>
    



    
</div>



<!-- 大屏分页 -->
<div id="pages" class="hidden-xs">
    <nav aria-label="Page navigation">
        <ul class="pagination">
          <li>
            <a href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
          <li>
            <a href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
</div>

<!-- 小屏幕分页 -->
<div class="visible-xs-block center-block">
    <nav aria-label="...">
        <ul class="pager">
          <li><a href="#"> <span class="glyphicon glyphicon-chevron-left"></span> </a></li>
          <li><a href="#"> <span class="glyphicon glyphicon-chevron-right"></span> </a></li>
        </ul>
      </nav>
</div>


    <%-- 页脚信息--%>
    <%@include file="../common/footer.jsp"%>




    <script type="text/javascript">
        $(function(){
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

        })
    </script>
</body>
</html>