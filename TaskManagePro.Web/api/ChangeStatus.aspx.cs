using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManagePro.BLL;

public partial class api_ChangeStatus : System.Web.UI.Page
{
    EcsService ecsService = new EcsService();
    BoardService boardService = new BoardService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerName"] == null)  //用户未登录
        {
            Response.Redirect("~/Login.aspx");
        }
        string name = Session["CustomerName"].ToString();
        string status = Request.Form["status"];
        string url = ecsService.SelectEcs(name).Url;
        string info = "";
        if (status == "1")
        {
            status = "open";
            info = name + "开启了他的页面展示：" + url;
        }
        else
        {
            status = "close";
            info = name + "关闭了他的页面展示：" + url;
        }
        ecsService.UpdateStatus(status, name);
        boardService.Insert(info);
        Response.Write("ok");
    }
}