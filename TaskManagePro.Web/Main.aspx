<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>个人主页</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main class="lyear-layout-content">

        <div class="container-fluid">

            <div class="col-sm-6 col-lg-4">
                <div class="card bg-danger">
                    <div class="card-body clearfix">
                        <div class="pull-right">
                            <p class="h6 text-white m-t-0">用户总数</p>
                            <p class="h3 text-white m-b-0"><%= UserCount %>人</p>
                        </div>
                        <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span></div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-lg-4">
                <div class="card bg-success">
                    <div class="card-body clearfix">
                        <div class="pull-right">
                            <p class="h6 text-white m-t-0">在线人数</p>
                            <p class="h3 text-white m-b-0"><%= OnlineCount %>人</p>
                        </div>
                        <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-arrow-up-bold fa-1-5x"></i></span></div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-lg-4">
                <div class="card bg-purple">
                    <div class="card-body clearfix">
                        <div class="pull-right">
                            <p class="h6 text-white m-t-0">新增公告</p>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:Timer ID="boardTime" runat="server" OnTick="boardTime_Tick" Interval="60000"></asp:Timer>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <p class="h3 text-white m-b-0"><%= BoardCount %> 条</p>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="boardTime" EventName="Tick" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                        <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-comment-outline fa-1-5x"></i></span></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4>公告板</h4>
                    </div>
                    <div class="card-body" style="min-height: 150px;">
                        <p>小胖成功AK题目，获得一血。</p>
                        <asp:Timer ID="Timer_" runat="server" OnTick="Timer__Tick" Interval="5000"></asp:Timer>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <p><%= BoardInfo %></p>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer_" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h4>每周用户</h4>
                    </div>
                    <div class="card-body">
                        <canvas class="js-chartjs-bars"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h4>网站流量</h4>
                    </div>
                    <div class="card-body">
                        <canvas class="js-chartjs-lines"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <script type="text/javascript" src="js/Chart.js"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            var $dashChartBarsCnt = jQuery('.js-chartjs-bars')[0].getContext('2d'),
                $dashChartLinesCnt = jQuery('.js-chartjs-lines')[0].getContext('2d');

            var $dashChartBarsData = {
                labels: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
                datasets: [
                    {
                        label: '注册用户',
                        borderWidth: 1,
                        borderColor: 'rgba(0,0,0,0)',
                        backgroundColor: 'rgba(51,202,185,0.5)',
                        hoverBackgroundColor: "rgba(51,202,185,0.7)",
                        hoverBorderColor: "rgba(0,0,0,0)",
                        data: [2500, 1500, 1200, 3200, 4800, 3500, 1500]
                    }
                ]
            };
            var $dashChartLinesData = {
                labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                datasets: [
                    {
                        label: '访问次数',
                        data: [20, 25, 40, 30, 45, 40, 55, 40, 48, 40, 42, 50],
                        borderColor: '#358ed7',
                        backgroundColor: 'rgba(53, 142, 215, 0.175)',
                        borderWidth: 1,
                        fill: false,
                        lineTension: 0.5
                    }
                ]
            };
            new Chart($dashChartBarsCnt, {
                type: 'bar',
                data: $dashChartBarsData
            });
            var myLineChart = new Chart($dashChartLinesCnt, {
                type: 'line',
                data: $dashChartLinesData,
            });
        });
    </script>
</asp:Content>
