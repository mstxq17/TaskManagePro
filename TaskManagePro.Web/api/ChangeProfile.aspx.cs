using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManagePro.BLL;
using TaskManagePro.DAL;

public partial class api_ChangeProfile : System.Web.UI.Page
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
        nickname = Request.Form["nickname"];
        email = Request.Form["email"];
        stunumber = person.StuNumber;
        introduce = Request.Form["introduce"];
        sex = person.Sex;
        personService.UpdatePerson(nickname, email, introduce, sex, name);
        Response.Write("修改成功!");
    }
}