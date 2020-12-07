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
    public class UserRoleController : Controller
    {
        private MyAppEntities db = new MyAppEntities();

        public ActionResult Index(int iduser,int idgroup=0)
        {
            ViewBag.idgroup = new SelectList(db.GroupLevel, "id", "remark", idgroup);
            string query = "select a.id,a.name,a.note,iif((select id from UserRole where id_role = a.id and id_user = '" + iduser + "' and allow_view= 1) is null,0,1) as allow_view,iif((select id from UserRole where id_role = a.id and id_user = '" + iduser + "' and allow_add= 1) is null,0,1) as allow_add,iif((select id from UserRole where id_role = a.id and id_user = '" + iduser + "' and allow_edit= 1) is null,0,1) as allow_edit,iif((select id from UserRole where id_role = a.id and id_user = '" + iduser + "' and allow_delete= 1) is null,0,1) as allow_delete,iif((select id from UserRole where id_role = a.id and id_user = '" + iduser + "' and allow_print= 1) is null,0,1) as allow_print,iif((select id from UserRole where id_role = a.id and id_user = '" + iduser + "' and allow_custom= 1) is null,0,1) as allow_custom,d.isView,d.isAdd,d.isEdit,d.isDelete,d.isPrint,d.isCustom from Roles a left join (select * from UserRole where id_user=" + iduser + ") b on a.id = b.id_role left join Users c on b.id_user = c.id left join RoleGroupLevel d on a.id =d.id_role where d.id_group_level ='" + idgroup + "' and 1 in (d.isView,d.isAdd,d.isEdit,d.isDelete,d.isPrint,d.isCustom) order by a.note,a.name";
            DataTable dt = SqlService.GetDataTable(query);
            var model = new List<UserRole>();
            foreach (DataRow dr in dt.Rows)
            {
                var userRole = new UserRole();
                userRole.Roles = new Roles();
                userRole.Roles.id = (long)dr.ItemArray[0];
                userRole.Roles.name = dr.ItemArray[1].ToString();
                userRole.Roles.note = dr.ItemArray[2].ToString();
                userRole.allow_view = (int)dr.ItemArray[3] == 1;
                userRole.allow_add =  (int)dr.ItemArray[4]==1;
                userRole.allow_edit =  (int)dr.ItemArray[5]==1;
                userRole.allow_delete =  (int)dr.ItemArray[6]==1;
                userRole.allow_print =  (int)dr.ItemArray[7]==1;
                userRole.allow_custom =  (int)dr.ItemArray[8]==1;
                userRole.Roles.AccessView = (DBNull.Value.Equals(dr.ItemArray[9])) ? false : (bool)dr.ItemArray[9];
                userRole.Roles.AccessAdd = (DBNull.Value.Equals(dr.ItemArray[10])) ? false : (bool)dr.ItemArray[10];
                userRole.Roles.AccessEdit = (DBNull.Value.Equals(dr.ItemArray[11])) ? false : (bool)dr.ItemArray[11];
                userRole.Roles.AccessDelete = (DBNull.Value.Equals(dr.ItemArray[12])) ? false : (bool)dr.ItemArray[12];
                userRole.Roles.AccessPrint = (DBNull.Value.Equals(dr.ItemArray[13])) ? false : (bool)dr.ItemArray[13];
                userRole.Roles.AccessCustom = (DBNull.Value.Equals(dr.ItemArray[14])) ? false : (bool)dr.ItemArray[14];
                model.Add(userRole);
            }
            return View("~/Views/appdashboard/adminsystem/User/UserRole/Index.cshtml",model);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public String Edit(int iduser, int id, FormCollection collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    var key = collection.GetValue("key").AttemptedValue;
                    var val = collection.GetValue("val").AttemptedValue;
                    if (myAppEntities.UserRole.Where(a => a.id_role == id).Where(a => a.id_user == iduser).Count() > 0)
                    {
                        string query = "update UserRole set " + key + " = '" + val + "' where id_role = '" + id + "' and id_user = '" + iduser + "' ";
                        myAppEntities.UserRole.SqlQuery(query).FirstOrDefault();
                    }
                    else
                    {
                        string query = "insert UserRole (" + key + ",id_role,id_user) values ('" + val + "','" + id + "','" + iduser + "')";
                        myAppEntities.UserRole.SqlQuery(query).FirstOrDefault();
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
