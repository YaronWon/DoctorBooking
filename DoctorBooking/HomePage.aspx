<%@ Page Title="דף הבית" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="DoctorBooking.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container{
            margin:auto;
            width:350px;

        }

    
        fieldset{
            margin:auto;
        }
      
    </style>
     <br /><br /><br />
    <fieldset>
    <div class="container">
        
        <h3 class="text-center">
             <asp:Literal ID="welcomelit" runat="server" />
        </h3>
       
        
        <a href="Register.aspx" class="btn btn-block btn-success" runat="server" id="MainReg"> הרשמה</a><br />
        <a href="Login.aspx" class="btn btn-block btn-primary" runat="server" id="MainLog"> התחברות</a>
       
        
       
        <asp:LinkButton class="btn btn-block btn-success" runat="server" ID="MainApp" Text="לקביעת תור" OnClick="MainApp_Click"/>
        <asp:Button runat="server" ID="ExitBtn" Class="btn btn-block btn-danger" Text="התנתקות" OnClick="ExitBtn_Click"/>
      
       
    </div>
   
    </fieldset>

</asp:Content>
