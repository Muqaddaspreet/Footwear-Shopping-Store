<%@ Page Title="" Language="C#" MasterPageFile="~/adminview.Master" AutoEventWireup="true" CodeBehind="adminchangepassword.aspx.cs" Inherits="footwarestore.adminchangepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-bordered">
        <tr>
            <td>Enter Old Password</td>
            <td>
                <asp:TextBox ID="tboldpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Enter New Password</td>
            <td>
                <asp:TextBox ID="tbnewpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Enter Confirm Password</td>
            <td>
                <asp:TextBox ID="tbconfpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnsubmit" runat="server" CssClass="bt btn-success" OnClick="btnsubmit_Click" Text="Submit" />
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
                        <asp:ControlParameter ControlID="tbnewpass" Name="password" PropertyName="Text" Type="String" />
                        <asp:SessionParameter Name="emailid" SessionField="adminemail" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
