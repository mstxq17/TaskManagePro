using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManagePro.BLL;
using TaskManagePro.DAL;


public partial class EcsPublic : System.Web.UI.Page
{
    EcsService ecsService = new EcsService();
    public string status;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerName"] == null)  //用户未登录
        {
            Response.Redirect("~/Login.aspx");
        }
        string name = Session["CustomerName"].ToString();
        Ecs ecs = ecsService.SelectEcs(name);
        status = ecs.Status;
    }
}