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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>后台管理</title>
  <%--   静态包含头部的js和css --%>
  <%@ include file="../common/head.jsp"%>
  <%--工程路径  http://localhost:8080/Blog/--%>
  <%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    request.setAttribute("basePatch",basePath);
  %>
    <style>
      .panel-body{
        padding: 0;
        height: 500px;
      }
      #accordion .list-group{
        margin: 0;
      }
    </style>
</head>
<body>
     <!-- 导航条 -->
     <nav id="nav" class="navbar navbar-inverse ">
        <div class="container-fluid">

          <div class="navbar-header">

            <button type="button" id="toggle" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="#">个人博客系统<span class="badge">v1.0</span></a>
          </div>
      
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul id="list" class="nav navbar-nav navbar-right" >
              <!-- 用户管理下拉菜单 -->
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 欢迎:
                  <span>${sessionScope.blogger.nickName}</span> </a>
                <ul class="dropdown-menu">
                  <li><a href="${basePatch}">返回主页</a></li>
                  
                  <li role="separator" class="divider"></li>
                  <li><a href="${basePatch}/logOut">退出登录</a></li>
                </ul>
              </li>



              <!-- 博客管理下拉菜单 -->
              <li class="dropdown hidden-sm hidden-md hidden-lg">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">博客管理 <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a class="switch" href="${basePatch}admin/blogManage.jsp">博客信息</a></li>

                  <li role="separator" class="divider"></li>
                  <li><a class="switch" href="${basePatch}admin/editormd.jsp">写博客</a></li>

                </ul>
              </li>

              <!-- 博客类型管理下拉菜单 -->
              <li class="dropdown hidden-sm hidden-md hidden-lg">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">博客类型管理 <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a class="switch" href="${basePatch}admin/blogTypeManage.jsp">博客类别</a></li>

                </ul>
              </li>

              <!-- 评论管理下拉菜单 -->
              <li class="dropdown hidden-sm hidden-md hidden-lg">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">评论管理 <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a class="switch" href="${basePatch}admin/getCommentModeration.jsp">评论审核</a></li>
                  <li><a class="switch" href="${basePatch}admin/getComments.jsp">评论信息</a></li>

                </ul>
              </li>


              <!-- 系统管理下拉菜单 -->
              <li class="dropdown hidden-sm hidden-md hidden-lg">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">系统管理 <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a class="switch" href="${basePatch}admin/linkManage.jsp">友情链接管理</a></li>
                  <li><a class="switch" href="${basePatch}admin/changePassword.jsp">修改密码</a></li>
                  <li><a class="switch" href="${basePatch}admin/personalInformationManage.jsp">修改个人信息</a></li>

                </ul>
              </li>


            </ul>
          
          </div> 
        </div>
      </nav>

<!-- 页面主体内容 -->
      <div class="container-fluid">
<!-- 栅格系统 -->
        <div class="row">

           <!-- 菜单 -->
          <div class="col-sm-2 hidden-xs">




            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                  <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      <span class="glyphicon glyphicon-list-alt"></span>  博客管理
                    </a>
                  </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                  <div class="panel-body">
                    <!-- 博客管理分类内容 -->
 
                     <div class="list-group">
                       <a href="${basePatch}admin/editormd.jsp" class="list-group-item switch">写博客</a>
                       <a href="${basePatch}admin/blogManage.jsp" class="list-group-item switch">博客信息</a>
                     </div>
                    
                   </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                  <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      <span class="glyphicon glyphicon-tags"></span> 博客类型管理
                    </a>
                  </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                  <div class="panel-body">
                    <!-- 博客类型管理分类内容 -->
                    <div class="list-group">
                      <a href="${basePatch}admin/blogTypeManage.jsp" class="list-group-item switch ">博客类别</a>
                    </div>
                </div>
                </div>
              </div>



              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                  <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      <span class="glyphicon glyphicon-comment"></span> 评论管理
                    </a>
                  </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                  <div class="panel-body">
                    <!-- 评论管理分类内容 -->
                    <a href="${basePatch}admin/getCommentModeration.jsp" class="list-group-item switch ">评论审核</a>
                    <a href="${basePatch}admin/getComments.jsp" class="list-group-item switch ">评论信息</a>
                   </div>
                </div>
              </div>


              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFour">
                  <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                      <span class="glyphicon glyphicon-wrench"></span> 系统管理
                    </a>
                  </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                  <div class="panel-body">
                    <!-- 系统管理分类内容 -->
                    <div class="list-group">
                      <a href="${basePatch}admin/linkManage.jsp" class="list-group-item switch">友情链接管理</a>
                      <a href="${basePatch}admin/changePassword.jsp" class="list-group-item switch">修改密码</a>
                      <a href="${basePatch}admin/personalInformationManage.jsp" class="list-group-item switch">修改个人信息</a>
                    </div>
                </div>
                </div>
              </div>



            </div>
              

          </div>

         



        
          <!-- 页面中心内容 -->
          <div class="col-sm-10">
            <div><iframe id="iframe" src="${basePatch}admin/blogManage.jsp" width="100%" height="800px" style="border: none; overflow: hidden;" ></iframe></div>
          </div>
       
          
      </div>

      </div>

<script>
  $(function(){

    //给switch类的a标签绑定单击事件,切换iframe的src,达到显示不同页面的效果
    $(".switch").click(function(){

      document.getElementById("iframe").src = this.href;

      return false;
    });

    //给手机端下的菜单中的a标签绑定单击事件,当点击时候调用#toggle的点击事件来关闭下拉菜单
    $("#list .switch").click(function () {
      $("#toggle").click();
    });


  })
</script>


</body>
</html>