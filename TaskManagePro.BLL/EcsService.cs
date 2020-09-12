using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TaskManagePro.DAL;

namespace TaskManagePro.BLL
{
    public class EcsService
    {
        TaskManageProDataContext db = new TaskManageProDataContext();
        public void Insert(string owner)
        {
            Ecs ecs = new Ecs
            {
                Owner = owner,
            };
            db.Ecs.InsertOnSubmit(ecs);
            db.SubmitChanges();
        }

        public Ecs SelectEcs(string owner)
        {
            Ecs ecs = (from c in db.Ecs
                             where c.Owner == owner
                       select c).First();
            return ecs;
        }

        public void UpdateEcs(string user, string password, string host, string url, string owner)
        {
            Ecs ecs = (from c in db.Ecs
                             where c.Owner == owner
                       select c).First();
            ecs.User = user;
            ecs.Password = password;
            ecs.Host = host;
            ecs.Url = url;
            db.SubmitChanges();
        }

        public void UpdateStatus(string status, string owner)
        {
            Ecs ecs = (from c in db.Ecs
                       where c.Owner == owner
                       select c).First();
            ecs.Status = status;
            db.SubmitChanges();
        }

        public bool IsNameExist(string owner)
        {
            Ecs ecs = (from c in db.Ecs
                       where c.Owner == owner
                              select c).FirstOrDefault();
            if (ecs != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
