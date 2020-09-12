using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TaskManagePro.DAL;

namespace TaskManagePro.BLL
{
    public class BoardService
    {
        TaskManageProDataContext db = new TaskManageProDataContext();
        public void Insert(String info)
        {
            Board board = new Board
            {
                Info = info,
            };
            db.Board.InsertOnSubmit(board);
            db.SubmitChanges();
        }

        public List<Board> GetAllInfo(int n)
        {
            return (from c in db.Board orderby c.BoardId descending
                    select c).Take(n).ToList();
        }

        public int GetCount()
        {
            return (from c in db.Board
                    select c).Count();
        }
    }
}
