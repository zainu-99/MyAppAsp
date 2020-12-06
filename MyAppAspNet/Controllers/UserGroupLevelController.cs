using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MyAppAspNet.Models;
using MyAppAspNet.Helper;

namespace MyAppAspNet.Controllers
{
    [AuthorizeUser]
    public class UserGroupLevelController : Controller
    {
        private MyAppEntities db = new MyAppEntities();

        // GET: UserGroupLevels
        public ActionResult Index(int iduser)
        {
            DataTable dt = SqlService.GetDataTable("select a.id,CONCAT(d.name,' - ',a.remark) as [group],CONCAT(f.name,' - ',e.remark)as parent,a.remark,a.id_parent,IIF((select id_user from UserGroupLevel where id_user ='" + iduser.ToString() + "' and id_group_level = b.id_group_level) is null,0,1) as IsJoin from GroupLevel a left join (select * from UserGroupLevel where id_user='" + iduser.ToString() + "') b on a.id = b.id_group_level left join  Groups as d on a.id_group = d.id left join GroupLevel as e on a.id_parent =e.id left join Groups as f on e.id_group = f.id");
            var model = new List<UserGroupLevelJoin>();
            Recursive(dt, "id_parent is null", model);
            return View("~/Views/appdashboard/adminsystem/User/UserGroupLevel/Index.cshtml", model);
        }

        public void Recursive(DataTable dt,String filter, List<UserGroupLevelJoin> list)
        {
            foreach (DataRow dr in dt.Select(filter))
            {
                var uglj = new UserGroupLevelJoin();
                uglj.id = (long)dr.ItemArray[0];
                uglj.group = dr.ItemArray[1].ToString();
                uglj.parent = dr.ItemArray[2].ToString();
                uglj.remark = dr.ItemArray[3].ToString();
                uglj.id_parent = DBNull.Value.Equals(dr.ItemArray[4]) ? 0 : (long)dr.ItemArray[4];
                uglj.isjoin = (int)dr.ItemArray[5] == 0 ? false : true;
                list.Add(uglj);
                uglj.child = new List<UserGroupLevelJoin>();
                Recursive(dt, "id_parent = " + uglj.id, uglj.child);
            }
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        public String Edit(int iduser, int id, FormCollection collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    Int64 is_checked = Convert.ToInt64(collection.GetValue("is_checked").AttemptedValue);
                    if (is_checked == 0)
                    {
                        string query = "delete from UserGroupLevel where id_user = '"+iduser+"' and id_group_level = '"+id+"'";
                        myAppEntities.UserGroupLevel.SqlQuery(query).FirstOrDefault();
                    }
                    else
                    {
                        string query = "delete from UserGroupLevel where id_user = '" + iduser + "' and id_group_level = '" + id + "';insert into UserGroupLevel (id_user,id_group_level) values('" + iduser+"','"+id+"');";
                        myAppEntities.RoleGroupLevel.SqlQuery(query).FirstOrDefault();
                    }
                }
                return "Success";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
