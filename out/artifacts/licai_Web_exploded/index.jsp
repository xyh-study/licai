<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>家庭理财系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script>
        if(window != top) {
            top.location.href = location.href;
        }
    </script>
</head>


<body class="login-bg">
<div class="login layui-anim layui-anim-up">
    <div class="message" style="font-size: 20px; font-weight: bold;">家庭理财系统</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form">
        <input name="username" placeholder="用户名" type="text" lay-verify="required" class="layui-input">
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码" type="password" class="layui-input">
        <hr class="hr20" >
        <input type="text" name="captcha" placeholder="图形验证码" autocomplete="off" class="captcha" value="" lay-verify="required">
        <div class="captcha-img">
            <img id="captchaPic" src="getCode" onclick="changeCode(this)"/>
        </div>
        <hr class="hr20">
        <button class="layui-btn layui-block" lay-submit lay-filter="login" style="width:100%; height: 50px;">登录
        </button>
    </form>
</div>

<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = layui.layer;
        form.on("submit(login)", function (data) {
            var btn = $(this);
            btn.text("登录中...").attr("disabled", "disabled").addClass("layui-disabled");
            $.ajax({
                url: "login",
                type: "post",
                data: {"method": "login", "username": data.field.username, "password": data.field.password, "captcha": data.field.captcha},
                dataType: "json",
                success: function (res,status,request) {
                    btn.text("登录").attr("disabled", false).removeClass("layui-disabled");
                    if(res.code === 200) {
                        layer.msg(res.msg, {time:800}, function () {
                            window.location.href = "system/index.jsp";
                        });
                    } else {
                        layer.msg(res.msg, {time:800} ,function() {
                            $("#captchaPic").attr("src", "getCode?id="+Math.random());
                        });
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    btn.text("登录").attr("disabled", false).removeClass("layui-disabled");
                    layer.msg("服务器异常...");
                }
            });
            return false;
        });
    });

    function changeCode(obj) {
        obj.src = "getCode?id="+Math.random();
    }
</script>
</body>
</html>