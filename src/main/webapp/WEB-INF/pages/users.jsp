<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户输入</title>

    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="container">
    <h3>请输入用户姓名</h3>
    <hr style="border-color: steelblue"/>

    <form class="form-horizontal" action="${pageContext.request.contextPath}/addUser" method="post">
        <div class="question-list panel panel-success" style="padding:10px; font-size: 16px;">
            <c:forEach var="i" begin="1" end="3">
                <div class="form-group">
                    <label for="firstName${i}" class="col-md-2 control-label">First Name ${i}：</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="firstName${i}" name="users[${i-1}].firstName"
                               required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastName${i}" class="col-md-2 control-label">Last Name ${i}：</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control required" id="lastName${i}" name="users[${i-1}].lastName"
                               required="required">
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-info" id="addBtn">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                </button>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">提交</button>
            </div>
        </div>
    </form>
</div>

<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
    $("#addBtn").click(function () {
        var user_num = $(".question-list .form-group").length / 2;
        if (user_num < 5) {
            var firstName = "<div class=\"form-group\">"
                    + "<label for=\"firstName" + (user_num + 1) + "\" class=\"col-md-2 control-label\">First Name " + (user_num + 1) + "：</label>"
                    + "<div class=\"col-md-10\">"
                    + "<input type=\"text\" class=\"form-control\" id=\"firstName" + (user_num + 1) + "\" name=\"users[" + (user_num) + "].firstName\" required=\"required\">"
                    + "</div></div>";

            var lastName = "<div class=\"form-group\">"
                    + "<label for=\"lastName" + (user_num + 1) + "\" class=\"col-md-2 control-label\">Last Name " + (user_num + 1) + "：</label>"
                    + "<div class=\"col-md-10\">"
                    + "<input type=\"text\" class=\"form-control\" id=\"lastName" + (user_num + 1) + "\" name=\"users[" + (user_num) + "].lastName\" required=\"required\">"
                    + "</div></div>";

            $(".question-list").append(firstName + lastName);
        } else {
            alert("最多只能输入 5 个用户，若想输入更多，请在提交本页后重新进入。");
        }
    });
</script>
</body>
</html>
