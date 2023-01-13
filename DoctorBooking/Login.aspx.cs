using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using DoctorBooking.App_Code;
using System.Net.Mail;
using System.Net;

namespace DoctorBooking
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //RegisterHyperLink.NavigateUrl = "Register";
            //// Enable this once you have account confirmation enabled for password reset functionality
            ////ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            //var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            //if (!String.IsNullOrEmpty(returnUrl))
            //{
            //    RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            //}
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if(loginE.Value == "admin10" && loginP.Value == "adminadmon")
            {
                //HttpCookie C = new HttpCookie();


                Response.Redirect("Admin.aspx");
                return;
            }
            
            Customer A = new Customer();
            if (A.LoginCustomer(loginE.Value, loginP.Value))
            {
                
                Response.Redirect("Default.aspx");
            }
            else
            {
                Error.Text = "שם או סיסמא לא נכונים";
            }
          

        }

        
    }
}