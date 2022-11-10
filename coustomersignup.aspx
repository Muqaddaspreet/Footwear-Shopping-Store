<%@ Page Title="" Language="C#" MasterPageFile="~/publicview.Master" AutoEventWireup="true" CodeBehind="coustomersignup.aspx.cs" Inherits="footwarestore.coustomersignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <style>
        body {
            color: #999;
            background: #f5f5f5;
            font-family: 'Roboto', sans-serif;
        }

        .form-control, .form-control:focus, .input-group-addon {
            border-color: #e1e1e1;
            border-radius: 0;
        }

        .signup-form {
            width: 390px;
            margin: 0 auto;
            padding: 30px 0;
        }

            .signup-form h2 {
                color: #636363;
                margin: 0 0 15px;
                text-align: center;
            }

            .signup-form .lead {
                font-size: 14px;
                margin-bottom: 30px;
                text-align: center;
            }

            .signup-form form {
                border-radius: 1px;
                margin-bottom: 15px;
                background: #fff;
                border: 1px solid #f3f3f3;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }

            .signup-form .form-group {
                margin-bottom: 20px;
            }

            .signup-form label {
                font-weight: normal;
                font-size: 13px;
            }

            .signup-form .form-control {
                min-height: 38px;
                box-shadow: none !important;
                border-width: 0 0 1px 0;
            }

            .signup-form .input-group-addon {
                max-width: 42px;
                text-align: center;
                background: none;
                border-bottom: 1px solid #e1e1e1;
                padding-left: 5px;
            }

            .signup-form .btn, .signup-form .btn:active {
                font-size: 16px;
                font-weight: bold;
                background: #19aa8d !important;
                border-radius: 3px;
                border: none;
                min-width: 140px;
            }

                .signup-form .btn:hover, .signup-form .btn:focus {
                    background: #179b81 !important;
                }

            .signup-form a {
                color: #19aa8d;
                text-decoration: none;
            }

                .signup-form a:hover {
                    text-decoration: underline;
                }

            .signup-form .fa {
                font-size: 21px;
                position: relative;
                top: 8px;
            }

            .signup-form .fa-paper-plane {
                font-size: 17px;
            }

            .signup-form .fa-check {
                color: #fff;
                left: 9px;
                top: 18px;
                font-size: 7px;
                position: absolute;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="signup-form">

        <h2>Create Account</h2>
        <p class="lead">It's free and hardly takes more than 30 seconds.</p>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                <asp:TextBox ID="tbemail" placeholder="Enter Email id" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="tbemail" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is must" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email id" ControlToValidate="tbemail" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>

                <asp:TextBox ID="tbpassword" CssClass="form-control" TextMode="Password" placeholder="Enter Password" runat="server"></asp:TextBox><br />

            </div>
            <asp:RequiredFieldValidator ControlToValidate="tbpassword" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is must" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <asp:TextBox ID="tbconfpassword" CssClass="form-control" TextMode="Password" placeholder="Enter Confirm Password" runat="server"></asp:TextBox><br />

            </div>
            <asp:RequiredFieldValidator ControlToValidate="tbconfpassword" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm password is must" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="tbconfpassword" ControlToCompare="tbpassword" CssClass="text-danger" runat="server" ErrorMessage="Password and Confirm Password not matched" Display="Dynamic"></asp:CompareValidator>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                <asp:TextBox ID="tbfullname" placeholder="Enter Full Name" CssClass="form-control" runat="server"></asp:TextBox><br />

            </div>
            <asp:RequiredFieldValidator ControlToValidate="tbfullname" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Fullname is must" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                <asp:TextBox ID="tbaddress" placeholder="Enter address" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox><br />

            </div>

            <asp:RequiredFieldValidator ControlToValidate="tbaddress" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Address is must" Display="Dynamic"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                <asp:TextBox ID="tbmobileno" placeholder="Enter Mobileno(10 Digit)" CssClass="form-control" runat="server"></asp:TextBox><br />
            </div>
            <asp:RequiredFieldValidator ControlToValidate="tbmobileno" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Mobileno is must" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid mobile no." ControlToValidate="tbmobileno" CssClass="text-danger" Display="Dynamic" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                <asp:RadioButtonList ID="rblgender" CssClass="form-control" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>

                </asp:RadioButtonList>
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" /><br />
            </div>
            <asp:RequiredFieldValidator ControlToValidate="FileUpload1" CssClass="text-danger" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Photo is must" Display="Dynamic"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                <asp:DropDownList ID="ddlquestion" CssClass="form-control" runat="server">
                    <asp:ListItem Selected="True">What is your favourite color?</asp:ListItem>
                    <asp:ListItem>What is your city of birth?</asp:ListItem>
                    <asp:ListItem>What is your pet&#39;s name?</asp:ListItem>
                    <asp:ListItem>Your favourite movie star?</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                <asp:TextBox ID="tbanswer" placeholder="Enter Answer" CssClass="form-control" runat="server"></asp:TextBox><br />
            </div>
            <asp:RequiredFieldValidator ControlToValidate="tbanswer" CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Answer is must" Display="Dynamic"></asp:RequiredFieldValidator>

        </div>
        <div class="form-group">
            <asp:Button ID="btnsubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnsubmit_Click" /><br />
            <asp:Label ID="lblmsg" CssClass="text-danger" runat="server"></asp:Label>
        </div>



        <div class="text-center">Already have an account? <a href="#">Login here</a>.</div>
    </div>

    <asp:HiddenField ID="HiddenField1_path" runat="server" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" DeleteCommand="DELETE FROM [customersignup] WHERE [emailid] = @emailid" InsertCommand="INSERT INTO customersignup(emailid, password, fullname, address, mobileno, gender, photo, question, answer, status) VALUES (@emailid, @password, @fullname, @address, @mobileno, @gender, @photo, @question, @answer, @status)" SelectCommand="SELECT * FROM [customersignup]" UpdateCommand="UPDATE [customersignup] SET [password] = @password, [fullname] = @fullname, [address] = @address, [mobileno] = @mobileno, [gender] = @gender, [photo] = @photo, [question] = @question, [answer] = @answer WHERE [emailid] = @emailid">
        <DeleteParameters>
            <asp:Parameter Name="emailid" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="tbemail" Name="emailid" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tbpassword" Name="password" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tbfullname" Name="fullname" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tbaddress" Name="address" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tbmobileno" Name="mobileno" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="rblgender" Name="gender" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="HiddenField1_path" Name="photo" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ddlquestion" Name="question" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="tbanswer" Name="answer" PropertyName="Text" Type="String" />
            <asp:Parameter DefaultValue="Active" Name="status" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="fullname" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="mobileno" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="photo" Type="String" />
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="answer" Type="String" />
            <asp:Parameter Name="emailid" Type="String" />
        </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
