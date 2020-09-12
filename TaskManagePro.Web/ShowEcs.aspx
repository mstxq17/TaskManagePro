<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowEcs.aspx.cs" Inherits="ShowEcs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>公开ECS列表</title>
    <style type="text/css">
        .auto-style1 {
            width: 73%;
            margin:0 auto;
        }
        .auto-style2 {
            text-align: center;
            font-size: large;
        }
        .auto-style3 {
            margin-bottom: 0px;
        }
        .auto-style4 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">ECS展示列表</td>
                </tr>
                <tr>
                    <td>
                        <div class="auto-style4">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="gvEcs" AllowSorting="True" CssClass="auto-style3" Height="63px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1397px">
                <Columns>
                    <asp:BoundField DataField="EcsId" HeaderText="ID" ReadOnly="True" SortExpression="EcsId" />
                    <asp:BoundField DataField="Owner" HeaderText="用户" ReadOnly="True" SortExpression="Owner" />
                    <asp:BoundField DataField="Host" HeaderText="主机地址" ReadOnly="True" SortExpression="Host" />
                    <asp:HyperLinkField DataNavigateUrlFields="Url" DataTextField="Url" HeaderText="主页URL" />
                </Columns>
            </asp:GridView>
                        </div>
            <asp:LinqDataSource ID="gvEcs" runat="server" ContextTypeName="TaskManagePro.DAL.TaskManageProDataContext" EntityTypeName="" Select="new (EcsId, Host, Owner, Url)" TableName="Ecs" Where="Status == @Status">
                <WhereParameters>
                    <asp:Parameter DefaultValue="open" Name="Status" Type="String" />
                </WhereParameters>
            </asp:LinqDataSource>

                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
