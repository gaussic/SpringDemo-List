<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户输入结果</title>

    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custome.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="container">
    <h3>用户输入结果列表</h3>
    <hr style="border-color: steelblue"/>

    <div class="question-list panel panel-success" style="padding:10px;">
        <h3>以下是输入成功的用户，数量 <span style="color: red">${succeedList.size()}</span></h3>
        <c:forEach var="i" begin="1" end="${succeedList.size()}">
            <h4 style="padding: 5px;">First Name ${i}： ${succeedList[i-1].firstName}</h4>
            <h4 style="padding: 5px;">Last Name ${i}： ${succeedList[i-1].lastName}</h4>
        </c:forEach>
    </div>

    <div class="question-list panel panel-success" style="padding:10px;">
        <h3>以下用户库中已存在，数量 <span style="color: red">${failList.size()}</span></h3>
        <c:forEach var="i" begin="1" end="${failList.size()}">
            <h4 style="padding: 5px;">First Name ${i}： ${failList[i-1].firstName}</h4>
            <h4 style="padding: 5px;">Last Name ${i}： ${failList[i-1].lastName}</h4>
        </c:forEach>
    </div>

    <div class="row" style="margin-bottom: 50px;">
        <div class="col-sm-offset-5 col-sm-7">
            <a type="button" href="${pageContext.request.contextPath}/users" class="btn btn-info"
               style="font-weight: bold; margin-bottom: 5px;">继续输入</a>
            <a type="button" href="${pageContext.request.contextPath}/" class="btn btn-info"
            style="font-weight: bold; margin-bottom: 5px;">返回首页</a>
        </div>
    </div>
</div>

<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
