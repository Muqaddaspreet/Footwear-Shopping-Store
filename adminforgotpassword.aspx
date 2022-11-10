<%@ Page Title="" Language="C#" MasterPageFile="~/publicview.Master" AutoEventWireup="true" CodeBehind="adminforgotpassword.aspx.cs" Inherits="footwarestore.adminforgotpassword" %>
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
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" DeleteCommand="DELETE FROM [administrator] WHERE [emailid] = @emailid" InsertCommand="INSERT INTO [administrator] ([emailid], [password]) VALUES (@emailid, @password)" SelectCommand="SELECT * FROM [administrator]" UpdateCommand="UPDATE [administrator] SET [password] = @password WHERE [emailid] = @emailid">
                    <DeleteParameters>
                        <asp:Parameter Name="emailid" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="emailid" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="emailid" Type="String" />
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
