<%@ Page Title="" Language="C#" MasterPageFile="~/publicview.Master" AutoEventWireup="true" CodeBehind="publicviewproducts.aspx.cs" Inherits="footwarestore.publicviewproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-bordered">
        <tr>
            <td>
                <asp:RadioButtonList ID="rblmaincategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblmaincategory_SelectedIndexChanged" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>Men</asp:ListItem>
                    <asp:ListItem>Women</asp:ListItem>
                    <asp:ListItem>Kids</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:TextBox ID="tbsearch" placehodler="product name" runat="server"></asp:TextBox>
                <asp:Button ID="btnsearch" runat="server" CssClass="btn btn-primary" EnableTheming="True" Text="Search" OnClick="btnsearch_Click" />
            </td>
        </tr>
    </table>

    <center>
    <asp:DataList  ID="DataList1" runat="server" DataKeyField="productid" CssClass="table" RepeatColumns="5" RepeatDirection="Horizontal">
        <ItemTemplate >
            <div style="min-height: 300px;">
            <asp:Image ID="Image1" CssClass="rounded img-fluid" ImageUrl='<%# Eval("topphoto") %>' runat="server" Height="170px" Width="197px" /><br />
            <div style="min-height: 60px;">
                <asp:Label ID="Label1" CssClass="font-italic" runat="server" Text='<%# Eval("productname") %>' />
            </div>
            <asp:Label ID="Label2" CssClass="text-danger" Font-Strikeout="true"
                runat="server" Text='<%#"&#8377;" + Eval("price") %>' /> &nbsp;
            
            <asp:Label ID="Label3" runat="server" CssClass="text-primary" Text='<%# Eval("discount") +"&percnt;" %>' />
            &nbsp;
            
            <asp:Label ID="Label4" runat="server" CssClass="text-success" Text='<%# "&#8377;" + Eval("netprice") %>' />

            <hr />
            <asp:HyperLink  NavigateUrl='<%# "publicproductdetail.aspx?pid=" + Eval("productid") %>'  CssClass="btn btn-warning" ID="HyperLink1" runat="server">Add To Cart</asp:HyperLink>
                </div>
        </ItemTemplate>
    </asp:DataList>
        </center>
    <asp:SqlDataSource ID="SqlDataSource1_all" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1_maincategory" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" SelectCommand="SELECT * FROM [product] WHERE ([main_category] = @main_category)">
        <SelectParameters>
            <asp:ControlParameter ControlID="rblmaincategory" Name="main_category" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1_searchall" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" SelectCommand="SELECT * FROM [product] WHERE ([productname] LIKE '%' + @productname + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbsearch" Name="productname" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1_searchcat" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" SelectCommand="SELECT * FROM [product] WHERE (([main_category] = @main_category) AND ([productname] LIKE '%' + @productname + '%'))">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1_search" Name="main_category" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="tbsearch" Name="productname" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1_search" runat="server" />
</asp:Content>
