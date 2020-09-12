<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TaskManageProRegister</title>
    <script src="Scripts/jquery-3.2.1.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Styles/login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="Login.aspx" id="login-form-link">登录</a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="Reg.aspx" class="active" id="register-form-link">注册</a>
                                </div>
                            </div>
                            <hr />
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="register-form">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" ID="rfvName" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email Address"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ID="rfvEmail" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="邮箱格式不正确！" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                            </asp:RegularExpressionValidator>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNo" CssClass="form-control" runat="server" placeholder="Student Number"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="txtNo" Display="Dynamic" ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revNO" runat="server" ErrorMessage="学号格式不正确！" ControlToValidate="txtNo" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9]{11}$"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtPwd" TextMode="Password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="txtPwd" Display="Dynamic" ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-8">
                                                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <asp:Button ID="btnReg" runat="server" CssClass="form-control btn btn-register" Text="立刻注册" OnClick="btnReg_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
