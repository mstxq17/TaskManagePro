<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="ChangePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>修改密码</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main class="lyear-layout-content">

        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="site-form">
                                <div class="form-group">
                                    <label for="old-password">旧密码</label>
                                    <input type="password" class="form-control" name="oldpwd" id="old-password" placeholder="输入账号的原登录密码">
                                </div>
                                <div class="form-group">
                                    <label for="new-password">新密码</label>
                                    <input type="password" class="form-control" name="newpwd" id="new-password" placeholder="输入新的密码">
                                </div>
                                <div class="form-group">
                                    <label for="confirm-password">确认新密码</label>
                                    <input type="password" class="form-control" name="confirmpwd" id="confirm-password" placeholder="再输入一次密码">
                                </div>
                                <button id="changePwd" type="submit" class="btn btn-primary">修改密码</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <script src="js/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="js/lightyear.js"></script>
    <script type="text/javascript">
        // 消息提示示例
        $('#changePwd').on('click', function () {
            lightyear.loading('show');
            var oldPassword = $("#old-password").val();
            var newPassword = $("#new-password").val();
            var confirmPassword = $("#confirm-password").val();
            if (newPassword != confirmPassword) {
                alert("两次密码不一致");
            } else {
                $.post("api/ChangePwdApi.aspx", { "oldPassword": oldPassword, "newPassword": newPassword }, function (data) {
                    if (data == "ok") {
                        alert(data);
                    } else {
                        alert(data);
                    }
                });
            }
            // 假设ajax提交操作
        });
    </script>

</asp:Content>

