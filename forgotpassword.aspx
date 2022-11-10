<%@ Page Title="" Language="C#" MasterPageFile="~/publicview.Master" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="footwarestore.forgotpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 52px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-bordered">
        <tr>
            <td>Enter Email Id</td>
            <td>
                <asp:TextBox ID="tbemail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbemail" CssClass="text-danger" ErrorMessage="Email is must"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Security Question</td>
            <td>
                <asp:DropDownList ID="ddlquestion" CssClass="form-control" runat="server">
                    <asp:ListItem Selected="True">What is your favourite color?</asp:ListItem>
                    <asp:ListItem>What is your city of birth?</asp:ListItem>
                    <asp:ListItem>What is your pet&#39;s name?</asp:ListItem>
                    <asp:ListItem>Your favourite movie star?</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Answer</td>
            <td class="auto-style1">
                <asp:TextBox ID="tbanswer" placeholder="Enter Answer" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbanswer" CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Answer is must" Display="Dynamic"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" DeleteCommand="DELETE FROM [customersignup] WHERE [emailid] = @emailid" InsertCommand="INSERT INTO [customersignup] ([emailid], [password], [fullname], [address], [mobileno], [gender], [photo], [question], [answer]) VALUES (@emailid, @password, @fullname, @address, @mobileno, @gender, @photo, @question, @answer)" SelectCommand="SELECT * FROM [customersignup]" UpdateCommand="UPDATE [customersignup] SET [password] = @password WHERE [emailid] = @emailid">
                    <DeleteParameters>
                        <asp:Parameter Name="emailid" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="emailid" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="fullname" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="mobileno" Type="String" />
                        <asp:Parameter Name="gender" Type="String" />
                        <asp:Parameter Name="photo" Type="String" />
                        <asp:Parameter Name="question" Type="String" />
                        <asp:Parameter Name="answer" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="HiddenField1_pass" Name="password" PropertyName="Value" />
                        <asp:ControlParameter ControlID="tbemail" Name="emailid" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="btnsubmit" runat="server" Text="Recover Password" CssClass="btn btn-primary" OnClick="btnsubmit_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:HiddenField ID="HiddenField1_pass" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
