<%@ Page Title="" Language="C#" MasterPageFile="~/publicview.Master" AutoEventWireup="true" CodeBehind="publicproductdetail.aspx.cs" Inherits="footwarestore.publicproductdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
               <table class="table table-bordered">
                <tr>
                    <td rowspan="4">
                        <asp:Image ID="Image_topview" runat="server" CssClass="rounded" Height="120px"  Width="150px" />
                    </td>
                    <td>Category</td>
                    <td>
                        <asp:Label ID="categoryLabel" runat="server"  />
                    </td>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td>
                        <asp:Label ID="productnameLabel" runat="server"  />
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>
                        <asp:Label ID="descriptionLabel" runat="server"  />
                    </td>
                </tr>
                <tr>
                    <td>Sizes</td>
                    <td>
                        <asp:RadioButtonList ID="rblsize" runat="server" RepeatDirection="Horizontal">
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td rowspan="7">
                        <asp:Image ID="Image_bottomview" runat="server" CssClass="rounded" Height="120px"  Width="150px" />
                    </td>
                    <td>Brand</td>
                    <td>
                        <asp:Label ID="brandLabel" runat="server"  />
                    </td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server"  />
                    </td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td>
                        <asp:DropDownList ID="ddlqty" runat="server" CssClass="form-control">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Discount %</td>
                    <td>
                        <asp:Label ID="discountLabel" runat="server"  />
                    </td>
                </tr>
                <tr>
                    <td>Net Price</td>
                    <td>
                        <asp:Label ID="netpriceLabel" runat="server"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblstatus" runat="server" CssClass="text-danger"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Enabled="true" OnClick="Button1_Click" Text="Add To Cart" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
                    </td>
                </tr>
            </table>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" SelectCommand="SELECT * FROM [product] WHERE ([productid] = @productid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="productid" QueryStringField="pid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
