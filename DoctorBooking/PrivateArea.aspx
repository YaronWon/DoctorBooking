<%@ Page Title="פרטי המשתמש" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrivateArea.aspx.cs" Inherits="DoctorBooking.PrivateArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        *{
            margin:auto;
        }
      
      .popup{
            margin:auto;
            width:650px;
            height:auto;
            box-shadow:6px 6px 29px -4px rgba(0,0,0,0.75);
            text-align:center;
            position:relative;
            border-radius:50px;
            
           
        }

       td{
           height:100px;
           width:200px;
          /*  border: 1px solid;*/
             text-align:center;
       }

       .row-head td{
           height:00px;
       }

        .popBlock{
            margin:auto;

     }

        .AppTable td{
            height:50px;
        }

        .popBlock table{
            margin:auto;

            text-align:center;
        }

        .popBlock p{
            text-align:center;

        }
        .popBlock p:first-child{
            align-self:center;
        }
        .popheader{
            font-size:18px;
        } 
        .textTable2{
            width:100%;
        }
        
       .appRemover{
           background-color:orangered;
           height:40px;


       }
       .appRemover:hover \ .LabelApp{
           display:inline-block;
       }
    </style>


                  <div runat="server" id="pop" class="popup" >

        <div class="popBlock">
         
            <h1>פרטי המשתמש</h1><br />

    <table>
        <tr>
            <td></td>
            <td>
               <p>
                  שם:
                
              </p>
                  <asp:Label runat="server" ID="CustName" />
            </td>
            <td></td>
        </tr>
        <tr>
  <td>
                <p>
                אימייל:
           
            </p>
           <asp:Label runat="server" ID="CustMail" />
            </td>
            <td>
                 <p>
                תעודת זהות:
                     
            </p>
                <asp:Label runat="server" ID="CustId" />
            </td>
            <td>
                  <p>
                תאריך לידה:
                    
            </p>
                <asp:Label runat="server" ID="CustBday" />
            </td>
        </tr>
         <tr>
            <td>
                 <p>
                כתובת:<br />
                     
            </p>
                <asp:Label runat="server" ID="CustAdress" />
            </td>
          
            <td>
                  <p>
                מספר טלפון:
          
            </p>
                    <asp:Label runat="server" ID="CustPhone" />
            </td>
            <td>
                  <p>
               שם משתמש:   
            </p>
                <asp:Label runat="server" ID="CustUserName" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <p class="textTable2"> תורים קיימים במערכת:</p>
            </td>
            <td></td>
        </tr>
    
      
    </table>
 
            <table class="AppTable">
                  <tr class="row-head">
                        <td>
                            תאריך:
                        </td>
                        <td>שעה:</td>
                    </tr>
                <asp:Repeater ID="AppRep" runat="server">
               
                  
                  <ItemTemplate>
               
                    
                   <tr>
                       
                       <td><%# DataBinder.Eval(Container.DataItem, "AppDate")%></td>
                       <td><%# DataBinder.Eval(Container.DataItem, "AppHour") %></td>
                       <td class="">
                  <div class="btngroup">
                      <a  class="appRemover"  href="AppRemover.ashx?id={<%# DataBinder.Eval(Container.DataItem , "AppID") %>}" id="AppRemove"><img src="Images/calendar-x.svg" width="40"/></a>
                      <p class="LabelApp" style="display:none;" id="LabelApps">
                          ביטול הפגישה
                      </p>
            
                     
                      </div>
                       </td>
                   </tr>
                    
               </ItemTemplate>
                </asp:Repeater>
            </table>

 <%--         <asp:Repeater  runat="server">
              <HeaderTemplate>

              </HeaderTemplate>
            <ItemTemplate>
                <%# Eval("AppointmentDate") %>
                <%# Eval("StartTime") %>
            </ItemTemplate>
          </asp:Repeater>
        </div>--%>
            <br /><br />
         <%--<asp:Repeater ID="AppoRep" runat="server" >
    <HeaderTemplate>
        <table>
            <thead>
                <tr>
                    <th style="width: 10%">Column 1 Header</th>
                    <th style="width: 30%">Column 2 Header</th>
                    <th style="width: 30%">Column 3 Header</th>
                    <th style="width: 30%">Column 4 Header</th>
                </tr>
            </thead>
    </HeaderTemplate>
    <ItemTemplate>
        <tr runat="server" id="rowID">
            <td>
                <asp:Label runat="server" ID="mylabel">You can add ASP labels if you want</asp:Label>
            </td>
            <td>
                <label>Or you can add HTML labels.</label>
            </td>
            <td>
                You can also just type plain text like this.
            </td>
            <td>
                <button type="button">You can even add a button to the table if you want!</button>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>--%>
    
    </div></div>
    <br /><br />
    <div class="footers">
    <a href="~/DetailChanger.aspx" class="btn btn-block btn-info" runat="server" id="ChangePass">לשינוי סיסמא</a>
    <a href="~/Default.aspx" class="btn btn-block btn-success" runat="server" id="MainApp"> חזרה לדף הבית</a> <br />
    <a href="Scheduler.aspx" class="btn btn-block btn-primary" runat="server" id="Private">לקביעת תור</a> <br />
    </div>
    <script>



        document.querySelector(".appRemover").addEventListener("mouseover", function () {
            document.getElementById("LabelApps").style.display = "flex";
        })
        document.querySelector(".appRemover").addEventListener("mouseout", function () {
            document.getElementById("LabelApps").style.display = "none";
        })
    </script>
</asp:Content>
