using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManagePro.BLL;

public partial class api_ChangePwdApi : System.Web.UI.Page
{
    UserService customerSrv = new UserService();
    protected void Page_Load(object sender, EventArgs e)
    {
        string oldPassword = Request.Form["oldPassword"];
        string newPassword = Request.Form["newPassword"];
        if (Session["CustomerName"] == null)  //用户未登录
        {
            Response.Redirect("~/Login.aspx");
        }
        else
        {
            if (customerSrv.CheckLogin(Session["CustomerName"].ToString(), oldPassword) > 0)
            {
                customerSrv.ChangePassword(Convert.ToInt32(Session["CustomerId"]), newPassword);
                Response.Write("ok,成功修改密码为:" + newPassword + "!");
            }
            else  //输入的原密码不正确
            {
                Response.Write("error,旧密码不正确!");
            }
        }
    }

}