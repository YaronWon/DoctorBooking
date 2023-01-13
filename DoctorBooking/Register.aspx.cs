using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using DoctorBooking.App_Code;

namespace DoctorBooking
{
    public partial class Register : Page
    {
        public void Create()
        {
            Customer A = new Customer(
                idcard.Value,
                fname.Value,
                lname.Value,
                Convert.ToDateTime(birth.Value),
                Address.Value,
                city.Value,
                email.Value,
                Phonenumber.Value,
                Gen.SelectedValue,
                email.Value,
                password.Value
                );

            A.AddCustomer(A);

            if (A.LoginCustomer(email.Value, password.Value))
            {
                Response.Redirect("Default.aspx");
            }
            
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var s = true;
            if (s)
            {
                if (email.Value.ToString() != EmailVal.Value.ToString())
                {
                    ErrorLit.Text += "אנא וודא דואר אלקטרוני" + "<br/>";
                    s = true;
                }
                else
                {
                    s = false;
                }
                if (password.Value.ToString() != PassVal.Value.ToString())
                {
                    ErrorLit.Text += "אנא וודא סיסמא" + "<br/>";
                    s = true;
                }
                else
                {
                    s = false;
                }
                if (idcard.Value.ToString().Length < 9)
                {
                    ErrorLit.Text += " תעודת זהות קצרה מדי" + "<br />";
                    s = true;
                }
                else
                {
                    s = false;
                }
                if (Phonenumber.Value.ToString().Length < 10)
                {
                    ErrorLit.Text += " מספר טלפון קצר מדי" + "<br />";
                    s = true;
                }
                else
                {
                    s = false;
                }
            }


            if (!s)
            {
                Create();
            }



        }

       

        protected void aaa_TextChanged(object sender, EventArgs e)
        {
           
        }
    }
}