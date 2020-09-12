<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EcsEditor.aspx.cs" Inherits="EcsEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <title>配置ECS</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--页面主要内容-->
    <main class="lyear-layout-content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h4>配置ECS信息</h4>
                </div>
                <div class="card-body">

                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-3 control-label">host</label>
                            <div class="col-md-6">
                                <input class="form-control" type="text" id="host" name="host" placeholder="请输入ECS主机地址" value="<%= host %>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">账号</label>
                            <div class="col-md-6">
                                <input class="form-control" type="text" id="username" name="username" placeholder="请输入账号.." value="<%= username %>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">密码</label>
                            <div class="col-md-6">
                                <input class="form-control" type="password" id="password" name="password" placeholder="请输入密码.." value="<%= password %>">
                            </div>
                            <i class="fa fa-eye-slash" onclick="showhide()" id="eye"></i>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">主页URL</label>
                            <div class="col-md-6">
                                <input class="form-control" type="text" id="url" name="url" placeholder="请输入主页URL.." value="<%= url %>">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-9 col-md-offset-3">
                                <button id="changeEcs" class="btn btn-primary" type="submit">保存</button>
                                <button class="btn btn-success" type="reset">重置</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>
    <!--End 页面主要内容-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <script src="js/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="js/lightyear.js"></script>
    <script type="text/javascript">
        var eye = document.getElementById("eye");
        var pwd = document.getElementById("password");

        function showhide() {

            if (pwd.type == "password") {
                pwd.type = "text";
                eye.className = 'fa fa-eye';
            } else {
                pwd.type = "password";
                eye.className = 'fa fa-eye-slash';
            }
        }
        $('#changeEcs').on('click', function () {
            lightyear.loading('show');
            var host = $("#host").val();
            var username = $("#username").val();
            var password = $("#password").val();
            var url = $("#url").val();
            $.post("api/ChangeEcs.aspx", { "host": host, "username": username, "password": password, "url":url }, function (data) {
                if (data == "ok") {
                    alert(data);
                } else {
                    alert(data);
                }
            });

            // 假设ajax提交操作
        });
    </script>
</asp:Content>

