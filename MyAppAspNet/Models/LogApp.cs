//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyAppAspNet.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class LogApp
    {
        public int ID { get; set; }
        public string Action { get; set; }
        public string TableName { get; set; }
        public string DataBefore { get; set; }
        public string DataAfter { get; set; }
        public Nullable<System.DateTime> Datetime { get; set; }
        public Nullable<long> UserID { get; set; }
        public string Note { get; set; }
    
        public virtual Users Users { get; set; }
    }
}
