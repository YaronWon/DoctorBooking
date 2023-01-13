<%@ Page Title="התחברות" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DoctorBooking.Login" Async="true" %>



<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style>
     fieldset{
         margin:auto;
       
     }
       
      label{
          text-align:center;
          justify-content:center;
          margin:auto;
      }
        
        .btn btn-primary{
            margin:auto;
        }
        .container{
            display:block;
            width:50%;
            margin:auto;
            border-top:100px;
        }
    </style>
    <br /><br /><br />
    <fieldset>
    <div class="container">
        <label for="loginE" > אימייל</label>
        <input type="text" id="loginE" runat="server" class="form-control" AutoCompleteType="Disabled" />
        <label for="loginP"> סיסמא</label>
        <input type="password" id="loginP" runat="server" class="form-control"/>
        <i id="show" class="fa fa-eye" aria-hidden="true" onclick="PassShow()" style="position:relative;right:85px;"></i>
                 <i id="hide" style="display:none;position:relative;right:85px;" class="fa fa-eye-slash" aria-hidden="true" onclick="PassShow()" ></i>
                 <br />
      <%--  <p style="color:orangered;">
            להתחברות לחשבון אדמין ,<br />
            שם משתמש: admin10 <br />
            סיסמא: adminadmon <br />
        </p>--%>
        <br /><br />
        <asp:Button runat="server" ID="LogBtn" class="btn btn-primary" OnClick="LogIn" Text="התחבר למערכת"/><br />
       <p style="color:orangered"><asp:Label runat="server" ID="Error" /></p>
        
    </div>
        </fieldset>
    <script>
        function PassShow() {
            var input = document.getElementById("<%= loginP.ClientID %>");
             var hide = document.getElementById("hide");
             var show = document.getElementById("show");

             if (input.type === "password") {
                 input.type = "text";
                 hide.style.display = "inline";
                 show.style.display = "none";
             }
             else {
                 input.type = "password";
                 show.style.display = "inline";
                 hide.style.display = "none";
             }
         }
    </script>
</asp:Content>
