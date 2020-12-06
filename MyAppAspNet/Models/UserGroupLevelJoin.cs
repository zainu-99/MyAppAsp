using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyAppAspNet.Models
{
    public class UserGroupLevelJoin
    {
        public long id { get; set; }
        public string group { get; set; }
        public string parent { get; set; }
        public long? id_parent { get; set; }
        public List<UserGroupLevelJoin> child { get; set; }
        public string remark { get; set; }
        public bool isjoin { get; set; }
    }
}