<%--头部导航--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav id="nav" class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="#">biuspの博客</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul id="list" class="nav navbar-nav navbar-right" >
                <li><a href="${basePatch}"> <span class="glyphicon glyphicon-home" id="homepage"></span> 主页</a></li>
                <li><a href="${basePatch}file"> <span class="glyphicon glyphicon-book" id="file"></span> 归档</a></li>
                <li><a href="${basePatch}getMessage"> <span class="glyphicon glyphicon-comment" id="message"></span> 留言</a></li>
                <li><a href="${basePatch}about"> <span class="glyphicon glyphicon-user" id="about"></span> 关于</a></li>
                <li><a href="https://github.com/rookie-2019"> <span class="glyphicon glyphicon-link"></span> github</a></li>
                <li ><a href="${basePatch}admin/login.jsp "> <span class="glyphicon glyphicon-blackboard"></span> 后台</a></li>
            </ul>

        </div>
    </div>
</nav>
