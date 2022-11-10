<%@ Page Title="" Language="C#" MasterPageFile="~/publicview.Master" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="footwarestore.admin_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <td>Password</td>
            <td>
                <asp:TextBox ID="tbpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbpass" CssClass="text-danger" ErrorMessage="Password is must"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" SelectCommand="SELECT * FROM [administrator]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="btlogin" runat="server" CssClass="btn btn-primary" OnClick="btlogin_Click" Text="Login" />
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/adminforgotpassword.aspx.cs">Forgot Password?</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
