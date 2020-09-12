using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManagePro.BLL;
using TaskManagePro.DAL;

public partial class Main : System.Web.UI.Page
{
    UserService userService = new UserService();
    BoardService boardService = new BoardService(); 
    public int UserCount;
    public int OnlineCount;
    public int BoardCount;
    public string BoardInfo;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerName"] == null)  //用户未登录
        {
            Response.Redirect("~/Login.aspx");
        }
        UserCount = userService.GetUserCount();
        OnlineCount = (int)Application["VisitNumber"];
        BoardCount = 1;

    }

    protected void boardTime_Tick(object sender, EventArgs e)
    {
        int ItemCount = boardService.GetCount();
        BoardCount = ItemCount - (int)Application["BoardCount"];
        Application["BoardCount"] = ItemCount;
    }

    protected void Timer__Tick(object sender, EventArgs e)
    {
        BoardInfo = "";
        List<Board> board = boardService.GetAllInfo(3);
        foreach( Board b in board)
        {
            BoardInfo +=  b.Info + "<br />";
        }
    }
}