<%@ Page Title="" Language="C#" MasterPageFile="~/publicview.Master" AutoEventWireup="true" CodeBehind="publicviewcart.aspx.cs" Inherits="footwarestore.publicviewcart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <h1>My Shopping Cart</h1>
    </div>

    <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered" DataSourceID="ObjectDataSource1" ShowFooter="True" OnRowDataBound="GridView1_RowDataBound">
        <Columns>

            <asp:ImageField HeaderText="Photo" DataImageUrlField="Photo">
                <ControlStyle Height="100px" Width="100px" />
            </asp:ImageField>
            <asp:BoundField HeaderText="Id" DataField="Pid" />
            <asp:BoundField HeaderText="Name" DataField="Pname" />
            <asp:BoundField HeaderText="Category" DataField="Category" />
            <asp:BoundField HeaderText="Price" DataField="Price" />
            <asp:BoundField HeaderText="Discount" DataField="Discount" />
            <asp:BoundField HeaderText="Net Price" DataField="NetPrice" />
            <asp:BoundField HeaderText="Qty" DataField="Qty" />
            <asp:BoundField HeaderText="Total Amount" DataField="TotalAmount" />
                      
           
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" OnCommand="ImageButton1_Command" 
                        CausesValidation="false" CommandArgument= '<%# Eval("Pid") %>'  ImageUrl="~/photos/cancelicon.png"  />
                </ItemTemplate>
            </asp:TemplateField>
                      
           
            </Columns>

    </asp:GridView>
    <table class="table table-bordered">
        <tr>
            <td colspan="8">
                <asp:Label ID="lbl1" runat="server" Text="Total Amount" />
            </td>
            <td>
                <asp:Label ID="lbltotal" runat="server" Text="" />
            </td>
        </tr>
        
    </table>
    <div class="text-center">
          <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Place Order" OnClick="Button1_Click" />
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getCart" TypeName="footwarestore.ShoppingCart"></asp:ObjectDataSource>
    <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
</asp:Content>
