<%@ Page Title="" Language="C#" MasterPageFile="~/adminview.Master" AutoEventWireup="true" CodeBehind="addcategory.aspx.cs" Inherits="footwarestore.addcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 428px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Add Category</h1>
    <table class="table table-bordered">
        <tr>
            <td class="auto-style1">Main Category</td>
            <td>
                <asp:DropDownList ID="ddlmaincategory" runat="server" CssClass="form-control">
                    <asp:ListItem Selected="True">Men</asp:ListItem>
                    <asp:ListItem>Women</asp:ListItem>
                    <asp:ListItem>Kids</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Category Name</td>
            <td>
                <asp:TextBox ID="tbcategory" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>
                <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-primary" OnClick="btnsubmit_Click" Text="Submit" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" DeleteCommand="DELETE FROM [category] WHERE [maincategory] = @maincategory AND [category] = @category" InsertCommand="INSERT INTO [category] ([maincategory], [category]) VALUES (@maincategory, @category)" SelectCommand="SELECT * FROM [category]">
                    <DeleteParameters>
                        <asp:Parameter Name="maincategory" Type="String" />
                        <asp:Parameter Name="category" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="ddlmaincategory" Name="maincategory" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="tbcategory" Name="category" PropertyName="Text" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
