<%@ Page Title="" Language="C#" MasterPageFile="~/adminview.Master" AutoEventWireup="true" CodeBehind="viewproduct.aspx.cs" Inherits="footwarestore.viewproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 532px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-bordered">
        <tr>
            <td class="auto-style1">Select Category</td>
            <td>
                <asp:RadioButtonList ID="rblmaincategory" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblmaincategory_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Men</asp:ListItem>
                    <asp:ListItem>Women</asp:ListItem>
                    <asp:ListItem>Kids</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
               
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" SelectCommand="SELECT * FROM [product] WHERE ([main_category] = @main_category)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="rblmaincategory" Name="main_category" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

     <div class="table table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="productid" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="productid" DataNavigateUrlFormatString="editdeleteproduct.aspx?pid={0}" Text="Edit Delete" />
                            <asp:BoundField DataField="productid" HeaderText="productid" InsertVisible="False" ReadOnly="True" SortExpression="productid" />
                            <asp:BoundField DataField="main_category" HeaderText="main_category" SortExpression="main_category" />
                            <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                            <asp:BoundField DataField="productname" HeaderText="productname" SortExpression="productname" />
                            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                            <asp:BoundField DataField="sizes" HeaderText="sizes" SortExpression="sizes" />
                            <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
                            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                            <asp:BoundField DataField="discount" HeaderText="discount" SortExpression="discount" />
                            <asp:BoundField DataField="netprice" HeaderText="netprice" SortExpression="netprice" />
                            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                            <asp:ImageField DataImageUrlField="topphoto" HeaderText="Top View">
                                <ControlStyle Height="100px" Width="100px" />
                            </asp:ImageField>
                            <asp:ImageField DataImageUrlField="bottomphoto" HeaderText="Bottom View">
                                <ControlStyle Height="100px" Width="100px" />
                            </asp:ImageField>
                        </Columns>
                    </asp:GridView>
                </div>
</asp:Content>
