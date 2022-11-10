<%@ Page Title="" Language="C#" MasterPageFile="~/adminview.Master" AutoEventWireup="true" CodeBehind="viewcategory.aspx.cs" Inherits="footwarestore.viewcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" SelectCommand="SELECT * FROM [category] order by maincategory"></asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" CssClass="table table-bordered" DataKeyNames="maincategory,category" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="maincategory" HeaderText="Main Category" ReadOnly="True" SortExpression="maincategory" />
        <asp:BoundField DataField="category" HeaderText="Category" ReadOnly="True" SortExpression="category" />
    </Columns>
    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#FFF1D4" />
    <SortedAscendingHeaderStyle BackColor="#B95C30" />
    <SortedDescendingCellStyle BackColor="#F1E5CE" />
    <SortedDescendingHeaderStyle BackColor="#93451F" />
</asp:GridView>
</asp:Content>
