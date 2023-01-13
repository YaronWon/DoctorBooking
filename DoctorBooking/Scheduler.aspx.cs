using DayPilot.Web.Ui;
using DayPilot.Utils;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Google.Apis.Calendar.v3;
using Google.Apis.Auth.OAuth2;
using System.IO;
using Google.Apis.Services;
using Google.Apis.Calendar.v3.Data;
using Event = Google.Apis.Calendar.v3.Data.Event;
using DoctorBooking.App_Code;
using System.Web.Services;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.Web.Http;

namespace DoctorBooking
{
    public partial class Scheduler : System.Web.UI.Page
    {
        public string APIkey = "AIzaSyDaAxZAKmOagcroOirXnRvs6RRRRK6a0xg";
        public string CalendarID = "iw.jewish#holiday@group.v.calendar.google.com";
        public bool Connect = true;
        //public DateTime c = new DateTime()
        public static string ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BookingData.mdf;Integrated Security=True;Connect Timeout=30";
        public string SelectedHour= " ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
               
                Unlog.Text = "המערכת זיהתה שאתה לא מחובר , מיד תועבר לדף ההתחברות";
                
                Response.Redirect("Login.aspx");

            }

            
           
            //Session["UserName"] = dr["FirstName"].ToString();
            //Session["UserLastName"] = dr["LastName"].ToString();
            //Session["UserIdCard"] = dr["IdCard"].ToString();
        }
        protected void Cale_DayRender(object sender, DayRenderEventArgs e)
        {
         
         
               
            
            

        }


        public void GetHour()
        {
            string Query = $"select * from OpenHour where DayOfTheWeek = '{Cale.SelectedDate.DayOfWeek.ToString()}'" ;
            string Unavialable = $"select StartTime from Appointment where AppointmentDate = '{Cale.SelectedDate.ToString("dd.MM.yyyy")}'";
            SqlConnection con = new SqlConnection(ConStr);
            SqlConnection con2 = new SqlConnection(ConStr);
            List<string> Dlist = new List<string>();
            List<string> HourList = new List<string> ();

            con.Open();
            con2.Open();
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlCommand UnApp = new SqlCommand(Unavialable, con2);
            SqlDataReader dr = cmd.ExecuteReader();
            SqlDataReader Uapp = UnApp.ExecuteReader();
            if (dr.Read())
            {
                DateTime startTime = DateTime.Parse(dr["OpenH"].ToString());
                DateTime endTime = DateTime.Parse(dr["CloseH"].ToString());
                while (startTime <= endTime )
                {
              
                    string v = startTime.ToString("HH:mm");
                    Dlist.Add(v);
                    startTime = startTime.AddHours(1);

                }

                while (Uapp.Read())
                {
                    HourList.Add(Uapp["StartTime"].ToString());
                }
                con.Close();

                
                for(int i = 0; i < Dlist.Count; i++)
                {
                   
                    for(int j = 0; j < HourList.Count; j++)
                    {
                        if(Dlist[i].ToString()==HourList[j].ToString())
                        {
                            Dlist.RemoveAt(i);
                        }
                    }
                    
                }

                if (Cale.SelectedDate.DayOfWeek.ToString() != "Saturday")
                {
                    Dlist.Insert(0, "--אנא בחר שעה--");
                    HourDrop.DataSource = Dlist;
                    HourDrop.DataBind();
                }
                

               
                //ddlCountries.DataTextField = "Country";
                //ddlCountries.DataValueField = "Country";
                // .DataSource = Dlist;
                // OpenH.DataBind();


            }

            else
            {

                con.Close();
                con2.Close();
            }

            
        }
        protected void Cale_SelectionChanged(object sender, EventArgs e)
        {
            popHead.Text = Cale.SelectedDate.ToString("dd.MM.yyyy");
            PopDay.Text = GetDay(Cale.SelectedDate.DayOfWeek.ToString());
            GetHour();

            if(Cale.SelectedDate.DayOfWeek.ToString() == "Saturday")
            {
                pop.Visible = false;
            }
            else
            {
                pop.Visible = true;
            }
            



        }

        public string GetDay(String A)
        {
            var b = "";
            if(A == "Sunday")
            { 
                b = "יום ראשון - " ;
                b += A;
                return b;
            }
            if (A == "Monday")
            {
                b = "יום שני - ";
                b += A;
                return b;
            }
            if (A == "Tuesday")
            {
                b = "יום שלישי - ";
                b += A;
                return b;
            }
            if (A == "Wednesday")
            {
                b= "יום רביעי - ";
                b += A;
                return b;
            }
            if (A == "Thursday")
            {
                b = "יום חמישי - ";
                b += A;
                return b;
            }
            if (A == "Friday")
            {
                b = "יום שישי - ";
                b += A;
                return b;
            }

            if (A == "Saturday")
            {
                b = "יום שבת - ";
                b += A;
                return b;
            }
            return A;
        }
        
        protected void AcceptBtn_Click(object sender, EventArgs e)
        {
            //RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            //LinkButton HHour = item.FindControl("HourOpen") as LinkButton;
            //string selectedHour = HHour.Text;
            // var f = HourDrop.SelectedItem.Text;
            //var HD = e.;


            string f = HourDrop.SelectedItem.ToString();
            Appointment A = new Appointment(
               Session["UserIdCard"].ToString(),
            Convert.ToDateTime( HourDrop.SelectedValue.ToString()).ToString("HH:mm"), Convert.ToDateTime( HourDrop.SelectedValue.ToString()).AddMinutes(45).ToString("HH:mm"),
              Cale.SelectedDate.ToString("dd.MM.yyyy")
                ) ;
            
            A.AddAppointment(A);

            Response.Redirect("PrivateArea.aspx");
        
        }

        [HttpPost]
        public void Ace(DropDownList A)
        {
            SelectedHour = A.SelectedItem.Text;
        }


        protected void HourOpen_Click(object sender, EventArgs e)
        {
           
        }

        protected void OpenH_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var x = e.Item.FindControl("HourOpen");
            if(x != null)
            {
                x.ID = (e.Item.ItemIndex + 1).ToString();
            }
        }

        protected void HourDrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            var DH = (DropDownList)sender;
            //Response.Redirect($"Sceduler.aspx?Hour={HourDrop.SelectedItem.Text}");
            SelectedHour = DH.SelectedItem.Text;

        }
    }
}