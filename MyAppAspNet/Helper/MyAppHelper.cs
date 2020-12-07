using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Web;

namespace MyAppAspNet.Helper
{
    public class MyAppHelper
    {
        public static string GetUserIdentityValue(IPrincipal user,string type)
        {
            var claimsIdentity = user.Identity as System.Security.Claims.ClaimsIdentity;
            var idusr = claimsIdentity.FindFirst(type).Value;
            return idusr;
        }
        public static String GetHashMD5(string txtinput)
        {
            using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(txtinput);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                // Convert the byte array to hexadecimal string
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString();
            }
        }
    }
}