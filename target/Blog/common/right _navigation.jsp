<%--右侧导航--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sidebar" style="margin:50px 0 0 50px; border-left:1px #9e9797 solid;color: #6e7173;" class="col-sm-2 hidden-xs ">
    <form class="form" action="  待输入 ">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default hidden">Submit</button>
    </form>

    <p style="margin-top: 20px; border-bottom:1px #9e9797 solid;padding-bottom: 10px;">&nbsp; <span class=" glyphicon glyphicon-tags"></span> 分类</p>
    <ul>
        <c:forEach items="${blogTypes}" var="type">
            <li><a href="">${type.typeName}</a></li>
        </c:forEach>
    </ul>

    <p style="margin-top: 40px; border-bottom:1px #9e9797 solid;padding-bottom: 10px;">&nbsp; <span class="glyphicon glyphicon-book"></span> 最近文章</p>

    <ul >

        <c:forEach items="${blogs}" var="blog" begin="0" end="3">
            <li><a href="${basePatch}getBlog?id=${blog.id}">${blog.title}</a></li>
        </c:forEach>

    </ul>

    <p id="link" style="margin-top: 40px; border-bottom:1px #9e9797 solid;padding-bottom: 10px;"><span class="glyphicon glyphicon-link"></span> 友情链接</p>

    <ul >
        <c:forEach items="${links}" var="link">
            <li><a href="${link.linkUrl}">${link.linkName}</a></li>
        </c:forEach>

    </ul>

</div>