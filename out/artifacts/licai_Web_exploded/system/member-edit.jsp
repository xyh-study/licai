<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/4 0004
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->


<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <input type="hidden" id="id" name="id">
            <div class="layui-form-item">
                <label for="L_username" class="layui-form-label">
                    <span class="x-red">*</span>账号</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_username" name="username" required="" lay-verify="nikename"
                           autocomplete="off" class="layui-input" class="layui-disabled" disabled></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>将会成为您唯一的登入名
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">
                    <span class="x-red">*</span>邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_email" name="email" required="" lay-verify="email" autocomplete="off"
                           class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">
                    <span class="x-red">*</span>电话</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_tel" name="tel" required="" lay-verify="tel" autocomplete="off"
                           class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">
                    <span class="x-red">*</span>密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_pass" name="pass" required="" lay-verify="pass" autocomplete="off"
                           class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">编辑</button>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    layui.use(['form','layer'], function() {
        var form = layui.form;
        var layer = layui.layer;

        //自定义验证规则
        form.verify({
            // nikename: function (value) {
            //     if (value.length < 5) {
            //         return '昵称至少得5个字符啊';
            //     }
            // },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repass: function (value) {
                if ($('#L_pass').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });

        form.on('submit(add)', function (data) {
            $.ajax({
                url: '/system/member',
                type: 'post',
                data: {'method':'editAdmin', 'id':data.field.id, 'username':data.field.username, 'pass':data.field.pass, 'repass':data.field.repass, 'email':data.field.email, 'tel':data.field.tel},
                dataType: 'json',
                success: function(res) {
                    if(res.code === 200) {
                        layer.msg("编辑成功", {icon: 6}, function() {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            // 关闭当前frame
                            parent.layer.close(index);
                            // 父页面刷新
                            window.parent.location.reload();
                        })
                    } else {
                        layer.msg(res.msg, {icon: 6}, function() {
                        })
                    }
                },
                error: function() {
                    layer.msg("服务器异常...");
                }
            });
            return false;
        });
    });

    // 获取 member-edit.html 父窗口传递给页面url参数
    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) {
                return pair[1];
            }
        }
        return (false);
    }

    // 监听页面元素加载结束后的动作
    $(function() {
        $("#L_email").val(getQueryVariable("uEmail"));
        $("#L_username").val(decodeURI(getQueryVariable("uName")));
        $("#id").val(getQueryVariable("id"));
        $("#L_tel").val(getQueryVariable("uTel"));
    });
</script>
</html>