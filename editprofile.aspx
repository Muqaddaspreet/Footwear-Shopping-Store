<%@ Page Title="" Language="C#" MasterPageFile="~/customer_view.Master" AutoEventWireup="true" CodeBehind="editprofile.aspx.cs" Inherits="footwarestore.editprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td>Email id</td>
            <td>
                <asp:TextBox ID="tbemail" placeholder="Enter Email id" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Full Name</td>
            <td>
                <asp:TextBox ID="tbfullname" placeholder="Enter Full Name" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbfullname" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Fullname is must" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Address</td>
            <td>
                <asp:TextBox ID="tbaddress" placeholder="Enter address" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>

            <asp:RequiredFieldValidator ControlToValidate="tbaddress" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Address is must" Display="Dynamic"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>Mobile No.</td>
            <td>
                <asp:TextBox ID="tbmobileno" placeholder="Enter Mobileno(10 Digit)" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbmobileno" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Mobileno is must" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid mobile no." ControlToValidate="tbmobileno" CssClass="text-danger" Display="Dynamic" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <asp:RadioButtonList ID="rblgender" CssClass="form-control" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>

                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>Photo</td>
            <td>
                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" /></td>
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
            <td>Answer</td>
            <td>
                <asp:TextBox ID="tbanswer" placeholder="Enter Answer" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbanswer" CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Answer is must" Display="Dynamic"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
