using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManagePro.BLL;
using TaskManagePro.DAL;

public partial class api_ChangeEcs : System.Web.UI.Page
{
    EcsService ecsService = new EcsService();
    BoardService boardService = new BoardService();
    public string host;
    public string username;
    public string password;
    public string url;
    public string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerName"] == null)  //用户未登录
        {
            Response.Redirect("~/Login.aspx");
        }
        name = Session["CustomerName"].ToString();
        host = Request.Form["host"];
        username = Request.Form["username"];
        password = Request.Form["password"];
        url = Request.Form["url"];
        ecsService.UpdateEcs(username, password, host, url, name);

        Response.Write("ok");
    }
}