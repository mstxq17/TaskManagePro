using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManagePro.BLL;
public partial class Login : System.Web.UI.Page
{
    UserService customerSrv = new UserService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerName"] != null)
        {
            Response.Redirect("~/Main.aspx");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (true)
        {
            if (txtName.Text.Trim() == "" || txtPwd.Text.Trim() == "")
            {
                Response.Write("<script>alert('用户名或密码不能为空!');</script>");
            }
            else
            {
                //调用CustomerService类中的CheckLogin()方法检查输入的用户名和密码是否正确
                int customerId = customerSrv.CheckLogin(txtName.Text.Trim(), txtPwd.Text.Trim());
                if (customerId > 0)   //用户名和密码正确
                {
                    Session.Clear();   //清理Session中保存的内容        
                    Session["CustomerId"] = customerId;
                    Session["CustomerName"] = txtName.Text;
                    Response.Redirect("~/Main.aspx");
                }
                else  //用户名或密码错误
                {
                    Response.Write("<script>alert('用户名或密码错误!');</script>");
                }
            }
        }
    }
}