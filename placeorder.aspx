<%@ Page Title="" Language="C#" MasterPageFile="~/customer_view.Master" AutoEventWireup="true" CodeBehind="placeorder.aspx.cs" Inherits="footwarestore.placeorder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 546px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">Delivery&nbsp; Address</td>
            <td>
                <asp:TextBox ID="tbaddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Bill Amount</td>
            <td>
                <asp:TextBox ID="tbbillamount" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Payment Type</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-control" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="COD">Cash On Delivery</asp:ListItem>
                    <asp:ListItem Value="Online">Online Payment</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" OnClick="Button1_Click" Text="Place Order" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:HiddenField ID="HiddenField1_billdate" runat="server" />
                <asp:SqlDataSource ID="SqlDataSource1_bill" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" DeleteCommand="DELETE FROM [bill] WHERE [billid] = @billid" InsertCommand="INSERT INTO [bill] ([name], [emailid], [mobileno], [dateofbill], [address], [billamount], [paymentmode], [status]) VALUES (@name, @emailid, @mobileno, @dateofbill, @address, @billamount, @paymentmode, @status);
set @billid = @@IDENTITY" OnInserted="SqlDataSource1_bill_Inserted" SelectCommand="SELECT * FROM [bill]" UpdateCommand="UPDATE [bill] SET [name] = @name, [emailid] = @emailid, [mobileno] = @mobileno, [dateofbill] = @dateofbill, [address] = @address, [billamount] = @billamount, [paymentmode] = @paymentmode, [status] = @status WHERE [billid] = @billid">
                    <DeleteParameters>
                        <asp:Parameter Name="billid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="name" SessionField="name" Type="String" />
                        <asp:SessionParameter Name="emailid" SessionField="email" Type="String" />
                        <asp:SessionParameter Name="mobileno" SessionField="mobileno" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField1_billdate" Name="dateofbill" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="tbaddress" Name="address" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="tbbillamount" Name="billamount" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="paymentmode" PropertyName="SelectedValue" Type="String" />
                        <asp:Parameter DefaultValue="Pending" Name="status" Type="String" />
                        <asp:Parameter Direction="Output" Name="billid" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="emailid" Type="String" />
                        <asp:Parameter Name="mobileno" Type="String" />
                        <asp:Parameter Name="dateofbill" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="billamount" Type="Int32" />
                        <asp:Parameter Name="paymentmode" Type="String" />
                        <asp:Parameter Name="status" Type="String" />
                        <asp:Parameter Name="billid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_billdetails" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" DeleteCommand="DELETE FROM [billdetails] WHERE [id] = @id" InsertCommand="INSERT INTO [billdetails] ([billid], [pid], [pname], [price], [discount], [netprice], [qty], [totalamount]) VALUES (@billid, @pid, @pname, @price, @discount, @netprice, @qty, @totalamount)" SelectCommand="SELECT * FROM [billdetails]" UpdateCommand="UPDATE [billdetails] SET [billid] = @billid, [pid] = @pid, [pname] = @pname, [price] = @price, [discount] = @discount, [netprice] = @netprice, [qty] = @qty, [totalamount] = @totalamount WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="HiddenField1_billid" Name="billid" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="HiddenField1_pid" Name="pid" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="HiddenField1_pname" Name="pname" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField1_price" Name="price" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="HiddenField1_discount" Name="discount" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="HiddenField1_netprice" Name="netprice" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="HiddenField1_qty" Name="qty" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="HiddenField1_totalamount" Name="totalamount" PropertyName="Value" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="billid" Type="Int32" />
                        <asp:Parameter Name="pid" Type="Int32" />
                        <asp:Parameter Name="pname" Type="String" />
                        <asp:Parameter Name="price" Type="Int32" />
                        <asp:Parameter Name="discount" Type="Int32" />
                        <asp:Parameter Name="netprice" Type="Int32" />
                        <asp:Parameter Name="qty" Type="Int32" />
                        <asp:Parameter Name="totalamount" Type="Int32" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="HiddenField1_billid" runat="server" />
            </td>
            <td>
                <asp:HiddenField ID="HiddenField1_pid" runat="server" />
                <asp:HiddenField ID="HiddenField1_pname" runat="server" />
                <asp:HiddenField ID="HiddenField1_price" runat="server" />
                <asp:HiddenField ID="HiddenField1_discount" runat="server" />
                <asp:HiddenField ID="HiddenField1_netprice" runat="server" />
                <asp:HiddenField ID="HiddenField1_qty" runat="server" />
                <asp:HiddenField ID="HiddenField1_totalamount" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
