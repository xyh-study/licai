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
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--></head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <input type="hidden" id="id" name="id">
            <div class="layui-form-item">
                <label for="L_username" class="layui-form-label">
                    <span class="x-red">*</span>家庭成员</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_username" name="username" lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>请输入家庭成员名称
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_username" class="layui-form-label"></label>
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

        form.on('submit(add)', function (data) {
            $.ajax({
                url: './member',
                type: 'post',
                data: {'method':'editFamily', 'id':data.field.id, 'f_name':data.field.username},
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
        $("#L_username").val(decodeURI(getQueryVariable("f_name")));
        $("#id").val(getQueryVariable("id"));
    });
</script>
</html>