<%@ Page Title="" Language="C#" MasterPageFile="~/customer_view.Master" AutoEventWireup="true" CodeBehind="customer_changepassword.aspx.cs" Inherits="footwarestore.customer_changepassword" %>
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
                        <asp:ControlParameter ControlID="tbnewpass" Name="password" PropertyName="Text" />
                        <asp:SessionParameter Name="emailid" SessionField="email" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
