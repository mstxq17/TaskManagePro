<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProfileEdit.aspx.cs" Inherits="ProfileEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>个人信息</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main class="lyear-layout-content">

        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="edit-avatar">
                                <img src="images/users/avatar1.png" alt="..." class="img-avatar">
                                <div class="avatar-divider"></div>
                                <div class="edit-avatar-content">
                                    <button class="btn btn-default">修改头像</button>
                                    <p class="m-0">选择一张你喜欢的图片，裁剪后会自动生成264x264大小，上传图片大小不能超过2M。</p>
                                </div>
                            </div>
                            <hr>
                            <div class="site-form">
                                <div class="form-group">
                                    <label for="username">用户名</label>
                                    <input type="text" class="form-control" name="username" id="username" value="<%=  Session["CustomerName"] %>" disabled="disabled" />
                                </div>
                                <div class="form-group">
                                    <label for="nickname">昵称</label>
                                    <input type="text" class="form-control" name="nickname" id="nickname" placeholder="输入您的昵称" value="<%= nickname %>"">
                                </div>
                                <div class="form-group">
                                    <label for="email">邮箱</label>
                                    <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="请输入正确的邮箱地址" value="<%= email %>"">
                                    <small id="emailHelp" class="form-text text-muted">请保证您填写的邮箱地址是正确的。</small>
                                </div>
                                <div class="form-group">
                                    <label for="nickname">学号</label>
                                    <input type="text" class="form-control" name="stuNo" id="stuNo" placeholder="输入您的学号" value="<%= stunumber %>"" disabled="disabled">
                                </div>
                                <div class="form-group">
                                    <label for="nickname">性别:</label>
                                    <asp:RadioButton ID="rbmale" GroupName="male" runat="server" Text="男" />
                                    &nbsp;&nbsp;
                                    <asp:RadioButton ID="rbFemale" GroupName="male" runat="server" Text="女"/>
                                </div>
                                <div class="form-group">
                                    <label for="remark">简介</label>
                                    <textarea class="form-control" name="remark" id="remark" rows="3"><%= introduce %></textarea>
                                </div>
                                <button  id="changeProfile" type="submit" class="btn btn-primary">保存</button>
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
        $('#changeProfile').on('click', function () {
            lightyear.loading('show');
            var nickname = $("#nickname").val();
            var email = $("#email").val();
            //var sex = "女";
            var introduce = $("#remark").val();
            $.post("api/ChangeProfile.aspx", { "nickname": nickname, "email": email, "introduce": introduce }, function (data) {
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

