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
    
    public partial class Roles
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Roles()
        {
            this.MenuApp = new HashSet<MenuApp>();
            this.RoleGroupLevel = new HashSet<RoleGroupLevel>();
            this.UserRole = new HashSet<UserRole>();
        }
    
        public long id { get; set; }
        public string name { get; set; }
        public string note { get; set; }
        public string url { get; set; }
        public string controller { get; set; }
        public bool AccessView { get; set; }
        public bool AccessAdd { get; set; }
        public bool AccessEdit { get; set; }
        public bool AccessDelete { get; set; }
        public bool AccessPrint { get; set; }
        public bool AccessCustom { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MenuApp> MenuApp { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RoleGroupLevel> RoleGroupLevel { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserRole> UserRole { get; set; }
    }
}