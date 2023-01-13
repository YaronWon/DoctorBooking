using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoctorBooking
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
                if (Session["UserName"] == null && Session["UserLastName"] == null)
                {
                    welcomelit.Text = "שלום אורח!";
                    MainApp.Visible = false;
                    ExitBtn.Visible = false;
                    MainReg.Visible = true;
                    MainLog.Visible = true;

                }
                else
                {
                    welcomelit.Text = Session["UserName"].ToString() + " " + Session["UserLastName"].ToString() + "!";
                    MainApp.Visible = true;
                    ExitBtn.Visible = true;
                    MainReg.Visible =false;
                    MainLog.Visible = false;
                }
         
         
        }

        protected void ExitBtn_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("HomePage.aspx");
        }

        protected void MainApp_Click(object sender, EventArgs e)
        {
            Response.Redirect("Scheduler.aspx");
        }
    }
}