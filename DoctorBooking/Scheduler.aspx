<%@ Page Title="קביעת תור" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Scheduler.aspx.cs" Inherits="DoctorBooking.Scheduler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%--    <link href="CSS/CalStyle.css" rel="stylesheet" />--%>
    <style>
           .Cale{
            margin:auto;
            margin-top:50px;
            width:550px;
            direction:ltr;
        }
         
    /*    .Tstyle{
            text-align:center;
            background-color:antiquewhite;
            
        }*/
        .NextM{
            /*margin-right:50px;*/
            margin-left:90px;
           /* background-color:#ffffff;*/
          /* color:#ffffff;*/
          color:#ffffff;
          
          
            
        }

        .Days{
            width:29px;
            height:40px;
            background-color:#ffffff;
        }

        .Days:hover{
            background-color:#fcea87;
        }
   
        .popup{
            margin:auto;
            width:350px;
            height:300px;
            box-shadow:6px 6px 29px -4px rgba(0,0,0,0.75);
            text-align:center;
            position:relative;
        }

       

        .popBlock{
            margin:auto;
             margin-top:15px;
        }
        .popheader{
            font-size:18px;
        }
        .examplelable{
            background-color:#5fa1f7;
            width:10px;
            height:4px;
        }

        .NameDay{
            text-align:center;
            color:aliceblue;
            background-color:rgba(0,0,0,0.75);
            
        }
       
      /*.row{
           width:400px;
           margin-top:250px;*/
         /*  display:block;*/
      /*}
      .container{
          margin:auto;
      }*/

      .btn btn-primary:hover{
          background-color:#ffd800;
         
      }
      .btn btn-primary{
          display:block;
      }
      .Today:hover{
          background-color:#fcea87;
      }
      .Tstyle{
          height:200px;
          text-align:center;
          /*margin:auto;*/
          font-size:30px;
          color:aliceblue;
          background-color:#0077C0;
      }
    </style>
    <h2>
        <asp:Literal ID="Unlog" runat="server" />
    </h2>
   
             
<asp:Calendar runat="server" ID="Cale" 
               
                FirstDayOfWeek="Sunday"
                CssClass="Cale"
                DayHeaderStyle-BackColor="#000000"
                BorderWidth="1"
                OnDayRender="Cale_DayRender"
                OnSelectionChanged="Cale_SelectionChanged"
                NextPrevStyle-ForeColor="White"
                
                
               
                >
                
                <TodayDayStyle BackColor="Yellow" CssClass="Today"   />
                <DayStyle BorderWidth="1"  CssClass="Days" />
                <TitleStyle CssClass="Tstyle" />
               
                <NextPrevStyle CssClass="NextM"  />
                <DayHeaderStyle CssClass="NameDay" />
                <SelectedDayStyle BackColor="#0077C0"  />
                
            </asp:Calendar>

   

    <asp:UpdatePanel ID="upper" runat="server">
        <ContentTemplate>


                     <div runat="server" id="pop" class="popup" visible="false">

        <div class="popBlock">
            <br />
         <img src="Images/icons8-schedule-80.png" class="popImage" />
        <br /><br /><br />
            <asp:Label runat="server" ID="popHead" class="popheader"/><br />
            <asp:Label runat="server" ID="PopDay" class="popheader"/>
        <br /><br />
            
            <asp:DropDownList ID="HourDrop" runat="server" OnSelectedIndexChanged="AcceptBtn_Click"  />
           
            <asp:Button runat="server" ID="AcceptBtn" OnClick="AcceptBtn_Click" CssClass="btn btn-primary" Text="אישור תור"/>
          
        </div>
    
    </div>
                    </ContentTemplate>
    </asp:UpdatePanel>

    <br />
  

</asp:Content>









<%--    <p class="Datepicker">
        
        
      <input runat="server" type="date"  id="Datepicker" min="1997-01-01" dir="rtl"   />
    </p>
   
    
    <asp:Button runat="server" ID="Example" Class="btn btn-primary" text="יצירת אירוע" OnClick="Example_Click" />
    
    
    <script src="fullcalendar-master/assets/js/fullcalendar.js">
        
    </script>--%>


