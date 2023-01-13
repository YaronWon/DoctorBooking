using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DoctorBooking
{
    public partial class PrivateArea : System.Web.UI.Page
    {
        public static string ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BookingData.mdf;Integrated Security=True;Connect Timeout=30";
        public class AppitemList 
        {
            public string AppDate { get; set; }
            public string AppHour { get; set; }
            public string AppID { get; set; }

        }



        protected void Page_Load(object sender, EventArgs e)
        {
            string Query = $"select * from Customer where idCard ={Session["UserIdCard"].ToString()}";
            string AppQuery = $"select * from Appointment where CustomerID={Session["UserIdCard"].ToString()}";
            SqlConnection con = new SqlConnection(ConStr);
            SqlConnection Conn = new SqlConnection(ConStr);
            List<AppitemList> Appo = new List<AppitemList>();

            con.Open();
            
            SqlCommand cmd = new SqlCommand(Query, con);
            
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
               CustId.Text = dr["idCard"].ToString();
               CustName.Text = dr["FirstName"].ToString() + " " + dr["LastName"].ToString();
               CustMail.Text = dr["Email"].ToString();
               CustBday.Text = Convert.ToDateTime( dr["DateOfBirth"].ToString()).ToString("dd.MM.yyyy");
               CustAdress.Text = dr["Address"].ToString() +", " + dr["City"].ToString(); 
               CustPhone.Text = dr["Phone"].ToString();
               CustUserName.Text = dr["UserName"].ToString();
            }
            //while (drr.Read())
            //{
                
            //}
          
            con.Close();
            Conn.Open();
            SqlCommand ccmd = new SqlCommand(AppQuery, Conn);
            SqlDataReader drr = ccmd.ExecuteReader();
            while (drr.Read())
            { 
                AppitemList a = new AppitemList();
                a.AppDate = drr["AppointmentDate"].ToString();
                a.AppHour = drr["StartTime"].ToString();
                a.AppID = drr["AppointmentID"].ToString();
                Appo.Add(a);
            }
            Conn.Close();
            AppRep.DataSource = Appo;
            AppRep.DataBind();


        }
    }
}