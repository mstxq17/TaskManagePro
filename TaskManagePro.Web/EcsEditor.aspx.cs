using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManagePro.BLL;
using TaskManagePro.DAL;

public partial class EcsEditor : System.Web.UI.Page
{
    EcsService ecsService = new EcsService();
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
        if (!ecsService.IsNameExist(name))
        {
            ecsService.Insert(name);
        }
        Ecs ecs = ecsService.SelectEcs(name);
        host = ecs.Host;
        username = ecs.User;
        password = ecs.Password;
        url = ecs.Url;
    }
}