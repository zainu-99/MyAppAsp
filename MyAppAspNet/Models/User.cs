//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyAppAspNet.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public User()
        {
            this.ErrorReports = new HashSet<ErrorReport>();
            this.LogApps = new HashSet<LogApp>();
            this.UserGroupLevels = new HashSet<UserGroupLevel>();
            this.UserRoles = new HashSet<UserRole>();
        }
    
        public long id { get; set; }
        public string userid { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string nohp { get; set; }
        public string address { get; set; }
        public byte[] avatar { get; set; }
        public string gender { get; set; }
        public bool status { get; set; }
        public bool online_offline { get; set; }
        public string password_noencrypt { get; set; }
        public string password { get; set; }
        public string token { get; set; }
        public Nullable<System.DateTime> created_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
    
        public virtual ICollection<ErrorReport> ErrorReports { get; set; }
        public virtual ICollection<LogApp> LogApps { get; set; }
        public virtual ICollection<UserGroupLevel> UserGroupLevels { get; set; }
        public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
