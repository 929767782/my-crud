<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/12/29
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <!--获取项目路径-->
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <!--搭建显示页面-->
    <div class="container">
        <!--标题-->
        <div class="row"></div>
            <!--这一行占12列，最多就12列，所以占满了-->
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        <!--按钮-->
        <div class="row"></div>
            <!--这一行占4列，偏移8列，所以位置靠右侧-->
            <!--0000000011110000-->
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        <!--显示表格数据-->
        <div class="row"></div>
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="stu">
                        <tr>
                            <th>${stu.stuId}</th>
                            <th>${stu.stuName}</th>
                            <th>${stu.gender=="M"?"男":"女"}</th>
                            <th>${stu.email}</th>
                            <th>${stu.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"/>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"/>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        <!--显示分页信息-->
        <div class="row"></div>
            <!--分页文字信息-->
            <div class="col-md-6">
                当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总${pageInfo.total}条记录
            </div>
            <!--分页条信息-->
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${APP_PATH}/getstus?pn=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/getstus?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pagIenfo.navigatepageNums}" var="pageNum">
                            <c:if test="${pageNum == pageInfo.pageNum}">
                                <li class="active"><a href="#">${pageNum}</a></li>
                            </c:if>
                            <c:if test="${pageNum != pageInfo.pageNum}">
                                <li><a href="${APP_PATH}/getstus?pn=${pageNum}">${pageNum}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/getstus?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${APP_PATH}/getstus?pn=${pageInfo.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
    </div>
</body>
</html>
