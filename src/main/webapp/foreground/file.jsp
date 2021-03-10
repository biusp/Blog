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
        #file{
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

        .file_warpper li{
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }
        .file_warpper h2{
             font-weight: 600;
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

        <div class="col-sm-5 " >
<%--            归档的容器--%>
            <div class="file_warpper">
                <c:forEach items="${arrayLists}" var="blogList">

                    <div>
                        <h3><fmt:formatDate value="${blogList.get(0).releaseDate}" pattern="yyyy"/></h3>
                        <ul>
                            <c:forEach items="${blogList}" var="blog">
                                <li> <small><fmt:formatDate value="${blog.releaseDate}" pattern="MM-dd"/></small>
                                    <a style="text-decoration: none;color: #3c3c3c;" href="${basePatch}getBlog?id=${blog.id}">${blog.title}</a>
                                </li>
                            </c:forEach>


                        </ul>
                    </div>

                </c:forEach>




            </div>





        </div>


        

        <!-- 用来布局的  -->
<%--        <div class="col-sm-1"></div>--%>


        <!-- 右边导航条 -->

        <%@include file="../common/right _navigation.jsp"%>




    </div>
    



    
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