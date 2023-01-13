<%@ Page Title="הרשמה" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DoctorBooking.Register" %>



<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<link rel="stylesheet" href="CSS/RegCSS.css" />  
   
        <table  style="width:800px;margin-left:auto;margin-right:auto;float:left;">
        <tr >
            <td >
                <h2 class="Head" style="border-bottom:2px solid #8ebf42">   פרטי החשבון</h2>
            </td>
        </tr>
        <tr  >
            <td style="text-align:center;">
             <div class="AccBlock">
             <label class="form-label">  אימייל</label>
            <input type="email" class="form-control" runat="server" id="email" /><br />
                 <label class="form-label">סיסמא  </label>
            <input type="password" class="form-control"  runat="server" id="password" />
                 <i id="show" class="fa fa-eye" aria-hidden="true" onclick="PassShow()" style="position:relative;right:85px;"></i>
                 <i id="hide" style="display:none;position:relative;right:85px;" class="fa fa-eye-slash" aria-hidden="true" onclick="PassShow()" ></i>
                 <br />
          
             </div> 
            </td>
            <td style="text-align:center;">
                        <div class="AccBlock">
             <label class="form-label">אימות אימייל </label>
            <input type="email" class="form-control" runat="server" id="EmailVal" onkeyup="ChecksValE(this)" />
           <div id="CheckVal" style="width:75%" >
                 <i class="far fa-check-circle" id="CheckerVal"  style="display:inline;color:green;font-size:15px;">
                   תואם
                 </i>
             </div><br />
            <label class="form-label">אימות סיסמא</label>
            <input type="password" class="form-control" runat="server" id="PassVal" onkeyup="PassChecker(this)"/>
             <div id="PassVali" style="width:75%" >
                 <i class="far fa-check-circle" id="PassV"  style="display:inline;color:green;font-size:15px;" >
                   תואם
                 </i>
             </div><br />   
                     </div> 
            </td>
        </tr>
         <tr >
            <td >
                <h2 class="Head" style="border-bottom:2px solid #8ebf42">   פרטים אישיים</h2>
            </td>
        </tr>
        <tr style="text-align:center;">
            <td style="text-align:center;">
                    <div class="AccBlock">
            <label class="form-label">תעודת זהות</label> 
          
            <input type="text" class="form-control"  runat="server" id="idcard" ClientMode="Static" onkeyup="Check9(this);"/>
             <div id="Check9Digits" style="width:75%" >
                 <i class="far fa-check-circle" id="Checker9"  style="display:inline;color:red;font-size:15px;">
                     חייב להיות באורך 9 ספרות וללא אותיות
                 </i>
             </div>
          
            
            <label class="form-label">שם פרטי</label>
            <input type="text"  runat="server" id="fname" class="form-control" /> <br />
            <label class="form-label">שם משפחה</label>
            <input type="text" class="form-control"  runat="server" id="lname" /> <br />
                 <label class="form-label">כתובת</label>
            <input type="text" class="form-control" runat="server" id="Address" />
            
            </div>
            </td>
            <td style="text-align:center;">
                 <div class="AccBlock">
            <label >מין</label>
            <asp:dropdownlist runat="server" ID="Gen" class="form-control" style="width:260px;" > 
               <asp:ListItem Value="זכר"> זכר</asp:ListItem>
               <asp:ListItem Value="נקבה"> נקבה</asp:ListItem>
            </asp:dropdownlist>
            
            <label class="form-label" >תאריך לידה</label>
            <input type="date" class="form-control"  runat="server" id="birth" style="width:260px;" /><br />
            <label class="form-label">מספר טלפון</label>
            <input type="text"  class="form-control"  runat="server" id="Phonenumber" /><br />
               <label class="form-label">עיר</label>
            <input type="text" class="form-control" runat="server" id="city" /> 
            </div>
            
            </td>
        </tr>
            <tr style="height:89px;">
                <td></td>
                 <td>
                <div class="card-footer text-center">
              <asp:Button ID="RegD" runat="server"  class="btn btn-primary" Text="הרשמה" OnClick="CreateUser_Click"/>
            </div>
            <p class="Errors">

                <asp:Literal ID="ErrorLit" runat="server"  />
            </p>
            
         
     
                 </td>
                 <td></td>
            </tr>
    </table>
<script>

    ////document.getElementById("show").addEventListener("click", PassShow());
    ////document.getElementById("hide").addEventListener("click", PassShow());
    //hide show
    function PassShow() {
        var input = document.getElementById("<%= password.ClientID %>");
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

    function PassChecker(Pass) {
        var a = Pass.value;
        var b = document.getElementById("<%=password.ClientID%>").value;
        if (a === b) {
            document.getElementById('PassV').style.color = 'green';
            document.getElementById('PassV').innerText = 'תואם';
            document.getElementById('PassV').style.display = 'inline';
        }
        else {
            document.getElementById('PassV').style.color = 'red';
            document.getElementById('PassV').innerText = 'לא תואם';
            document.getElementById('PassV').style.display = 'none';

        }
    }

    function ChecksValE(Val) {
        var a = Val.value;
        //var b = document.getElementById('email').innerHTML;
        var c = document.getElementById("<%=email.ClientID%>").value;

        if (a === c) {
            document.getElementById('CheckerVal').style.color = 'green';
            document.getElementById('CheckerVal').innerText = 'תואם';
        }
        else {
            document.getElementById('CheckerVal').style.color = 'red';
            document.getElementById('CheckerVal').innerText = 'לא תואם';
        }

    }

    function Check9(Id) {
        var a = Id.value;
        if (a.length == 9 && /^[0-9]+$/.test(a)) {
            document.getElementById('Checker9').style.color = 'green';
        }
        else {
            document.getElementById('Checker9').style.color = 'red';
        }

     

    }
</script>
    
    
</asp:Content>
