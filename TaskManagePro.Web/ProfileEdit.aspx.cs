using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManagePro.BLL;
using TaskManagePro.DAL;

public partial class ProfileEdit : System.Web.UI.Page
{
    PersonService personService = new PersonService();
    public string name;
    public string nickname;
    public string email;
    public string stunumber;
    public string introduce;
    public string sex;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerName"] == null)  //用户未登录
        {
            Response.Redirect("~/Login.aspx");
        }
        name = Session["CustomerName"].ToString();
        Person person = personService.SelectPerson(name);
        nickname = person.NickName;
        email = person.Email;
        stunumber = person.StuNumber;
        introduce = person.Introduce;
        sex = person.Sex;
        if(sex == "女")
        {
            rbFemale.Checked = true;
            rbmale.Checked = false;
        }
        else
        {
            rbmale.Checked = true;
            rbFemale.Checked = false;
        }
    }

    protected void btnChangPwd_Click(object sender, EventArgs e)
    {
      
    }
}