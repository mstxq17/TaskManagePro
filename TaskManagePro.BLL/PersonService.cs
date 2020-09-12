using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TaskManagePro.DAL;

namespace TaskManagePro.BLL
{
    public class PersonService
    {
        TaskManageProDataContext db = new TaskManageProDataContext();

        public void Insert(string name, string nickname, string  email, string stunumber, string introduce, string sex)
        {
            Person person = new Person
            {
                Name = name,
                NickName = nickname,
                Email = email,
                StuNumber = stunumber,
                Introduce = introduce,
                Sex = sex
            };
            db.Person.InsertOnSubmit(person);
            db.SubmitChanges();
        }

        public void UpdatePerson(string nickname, string email, string introduce, string sex, string name)
        {
            Person person = (from c in db.Person
                                 where c.Name == name
                                 select c).First();
            person.NickName = nickname;
            person.Email = email;
            person.Introduce = introduce;
            person.Sex = sex;
            db.SubmitChanges();
        }

        public Person SelectPerson(string name)
        {
            Person person = (from c in db.Person
                             where c.Name == name
                             select c).First();
            return person;
        }
    }
}
