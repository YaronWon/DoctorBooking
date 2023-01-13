using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.SessionState;

namespace DoctorBooking
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            var c = context.Request.QueryString["date"] + "" ;
            context.Response.Write("Hello World" +"<br/>" + c);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}