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
    
    public partial class RoleGroupLevel
    {
        public long id { get; set; }
        public Nullable<long> id_role { get; set; }
        public Nullable<long> id_group_level { get; set; }
        public bool isView { get; set; }
        public bool isAdd { get; set; }
        public bool isEdit { get; set; }
        public bool isDelete { get; set; }
        public bool isPrint { get; set; }
        public bool isCustom { get; set; }
    
        public virtual GroupLevel GroupLevel { get; set; }
        public virtual Role Role { get; set; }
    }
}
