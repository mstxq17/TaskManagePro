<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EcsPublic.aspx.cs" Inherits="EcsPublic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>公开ECS列表</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main class="lyear-layout-content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h4>公开ECS</h4>
                </div>
                <div class="card-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-3 control-label">状态</label>
                            <div class="col-md-6">
                                <div class="clearfix">
                                    <label class="lyear-radio radio-inline radio-primary">
                                        <input type="radio" name="status" value="1" ><span>启用</span>
                                    </label>
                                    <label class="lyear-radio radio-inline radio-primary">
                                        <input type="radio" name="status" value="0"><span>禁用</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-9 col-md-offset-3">
                                <button  id="chanePublic" type="submit" class="btn btn-primary ajax-post">确 定</button>
                                <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
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
        window.onload = function () {
            var status = "<%= status %>";
            if (status == "open") {
                $("input[type='radio'][value='1']").prop("checked", true);
            } else {
                 $("input[type='radio'][value='0']").prop( "checked", true );
            }
        }
        // 消息提示示例
        $('#chanePublic').on('click', function () {
            lightyear.loading('show');
            var status = $("input[type='radio'][name='status']:checked").val();
            $.post("api/ChangeStatus.aspx", { "status": status }, function (data) {
                if (data == "ok") {
                    //alert(data);
                    console.log(data);
                } else {
                    //alert(data);
                    console.log(data);
                }
            });

            // 假设ajax提交操作
        });
    </script>
</asp:Content>

