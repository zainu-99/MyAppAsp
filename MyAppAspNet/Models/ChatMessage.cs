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
    
    public partial class ChatMessage
    {
        public long ID { get; set; }
        public string Message { get; set; }
        public string FileAttached { get; set; }
        public Nullable<long> UserID { get; set; }
        public Nullable<long> UserIDReciever { get; set; }
        public bool ReadStatus { get; set; }
        public bool DeleteStatusUserSender { get; set; }
        public bool DeleteStatusUserReciever { get; set; }
        public Nullable<System.DateTime> Created_At { get; set; }
    }
}
