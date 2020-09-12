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
    PersonService personSrv = new PersonService();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //调用CustomerService类中的IsNameExist()方法判断用户名是否重名
            if (customerSrv.IsNameExist(txtName.Text.Trim()))
            {
                lblMsg.Text = "注册失败，用户名已存在！";
            }else
            {
                if (customerSrv.IsNoExist(txtNo.Text.Trim()))
                {
                    lblMsg.Text = "注册失败，学号已存在！";
                }
                else
                {
                    //调用CustomerService类中的Insert()方法插入新用户记录
                    customerSrv.Insert(txtName.Text.Trim(), txtPwd.Text.Trim(), txtEmail.Text.Trim(), txtNo.Text.Trim());
                    personSrv.Insert(txtName.Text.Trim(), txtName.Text.Trim(), txtEmail.Text.Trim(), txtNo.Text.Trim(), "", "");
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
    }
}