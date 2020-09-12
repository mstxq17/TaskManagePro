using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TaskManagePro.DAL;

namespace TaskManagePro.BLL
{
    public class UserService
    {
        TaskManageProDataContext db = new TaskManageProDataContext();

        // 检查登录
        public int CheckLogin(string name, string password)
        {
            Users customer = (from c in db.Users
                                 where c.Name == name && c.Password == password
                                 select c).FirstOrDefault();
            if (customer != null)  //用户名和密码正确
            {
                return customer.UserId;
            }
            else  //用户名或密码错误
            {
                return 0;
            }
        }

        public bool IsNameExist(string name)
        {
            Users customer = (from c in db.Users
                                 where c.Name == name
                                 select c).FirstOrDefault();
            if (customer != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsNoExist(string no)
        {
            Users customer = (from c in db.Users
                              where c.StuNumber == no
                              select c).FirstOrDefault();
            if (customer != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void Insert(string name, string password, string email,string no)
        {
            Users customer = new Users
            {
                Name = name,
                Password = password,
                Email = email,
                StuNumber = no
            };
            db.Users.InsertOnSubmit(customer);
            db.SubmitChanges();
        }

        public void ResetPassword(string name, string email)
        {
            Users customer = (from c in db.Users
                                 where c.Name == name && c.Email == email
                                 select c).First();
            customer.Password = name;
            db.SubmitChanges();
        }

        public void ChangePassword(int customerId, string password)
        {
            Users customer = (from c in db.Users
                                 where c.UserId == customerId
                                 select c).First();
            customer.Password = password;
            db.SubmitChanges();
        }

        public int GetUserCount()
        {
            int count = (from c in db.Users
                         select c).Count();
            return count;
        }
    }
}
