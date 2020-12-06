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
    public class RoleGroupLevelController : Controller
    {
        private MyAppEntities db = new MyAppEntities();
        public ActionResult Index(int idgroup)
        {
            DataTable dt = SqlService.GetDataTable("select a.id,a.name,a.note,isView,isAdd,isEdit,isDelete,isPrint,isCustom,AccessView,AccessAdd,AccessEdit,AccessDelete,AccessPrint,AccessCustom from Roles a left join (select * from  RoleGroupLevel where id_group_level=" + idgroup + ") b on a.id =b.id_role order by a.url");
            var model = new List<RoleGroupLevel>();
            foreach(DataRow dr in dt.Rows)
            {
                var rgl = new RoleGroupLevel();
                rgl.Roles = new Roles();
                rgl.Roles.id = (long)dr.ItemArray[0];
                rgl.Roles.name = dr.ItemArray[1].ToString();
                rgl.Roles.note = dr.ItemArray[2].ToString();
                rgl.isView =(DBNull.Value.Equals( dr.ItemArray[3]))? false : (bool)dr.ItemArray[3];
                rgl.isAdd = (DBNull.Value.Equals(dr.ItemArray[4])) ? false : (bool)dr.ItemArray[4];
                rgl.isEdit = (DBNull.Value.Equals(dr.ItemArray[5])) ? false : (bool)dr.ItemArray[5];
                rgl.isDelete = (DBNull.Value.Equals(dr.ItemArray[6])) ? false : (bool)dr.ItemArray[6];
                rgl.isPrint = (DBNull.Value.Equals(dr.ItemArray[7])) ? false : (bool)dr.ItemArray[7];
                rgl.isCustom = (DBNull.Value.Equals(dr.ItemArray[8])) ? false : (bool)dr.ItemArray[8];
                rgl.Roles.AccessView = (DBNull.Value.Equals(dr.ItemArray[9])) ? false : (bool)dr.ItemArray[9];
                rgl.Roles.AccessAdd = (DBNull.Value.Equals(dr.ItemArray[10])) ? false : (bool)dr.ItemArray[10];
                rgl.Roles.AccessEdit = (DBNull.Value.Equals(dr.ItemArray[11])) ? false : (bool)dr.ItemArray[11];
                rgl.Roles.AccessDelete = (DBNull.Value.Equals(dr.ItemArray[12])) ? false : (bool)dr.ItemArray[12];
                rgl.Roles.AccessPrint = (DBNull.Value.Equals(dr.ItemArray[13])) ? false : (bool)dr.ItemArray[13];
                rgl.Roles.AccessCustom = (DBNull.Value.Equals(dr.ItemArray[14])) ? false : (bool)dr.ItemArray[14];
                model.Add(rgl);
            }
            return View("~/Views/appdashboard/adminsystem/GroupLevel/RoleGroupLevel/index.cshtml", model);
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        public String Edit(int idgroup,int id, FormCollection collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    var key = collection.GetValue("key").AttemptedValue;
                    var val = collection.GetValue("val").AttemptedValue;
                    if (myAppEntities.RoleGroupLevel.Where(a => a.id_role == id).Where(a=>a.id_group_level == idgroup).Count()>0)
                    {
                        string query = "update RoleGroupLevel set " + key +  " = '"+ val +"' where id_role = '" + id + "' and id_group_level = '" + idgroup + "' ";
                      myAppEntities.RoleGroupLevel.SqlQuery(query).FirstOrDefault();
                    }
                    else
                    {
                        string query = "insert RoleGroupLevel (" + key + ",id_role,id_group_level) values ('"+ val +"','"+ id +"','"+ idgroup +"')";
                        myAppEntities.RoleGroupLevel.SqlQuery(query).FirstOrDefault();
                    }
                }
                return "Success";
            }
            catch( Exception e)
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
