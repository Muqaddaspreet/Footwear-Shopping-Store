<%@ Page Title="" Language="C#" MasterPageFile="~/customer_view.Master" AutoEventWireup="true" CodeBehind="orderhistory.aspx.cs" Inherits="footwarestore.orderhistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function validate() {
            return confirm("Are you sure?");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <h1>Orders History</h1>
    </div>
    <div class="table table-responsive">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-bordered" DataKeyNames="billid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="billid" HeaderText="billid" InsertVisible="False" ReadOnly="True" SortExpression="billid" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="emailid" HeaderText="emailid" SortExpression="emailid" />
                <asp:BoundField DataField="mobileno" HeaderText="mobileno" SortExpression="mobileno" />
                <asp:BoundField DataField="dateofbill" HeaderText="dateofbill" SortExpression="dateofbill" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="billamount" HeaderText="billamount" SortExpression="billamount" />
                <asp:BoundField DataField="paymentmode" HeaderText="paymentmode" SortExpression="paymentmode" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnCommand="LinkButton1_Command" CommandName='<%# Eval("billid") %>' Text="View Details"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
               
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
    </div>
    <div >
        <h1 class="text-center">Order Details</h1>
        <asp:GridView ID="GridView_details" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" CssClass="table table-bordered" DataKeyNames="id" DataSourceID="SqlDataSource2_details">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="billid" HeaderText="billid" SortExpression="billid" />
                <asp:BoundField DataField="pid" HeaderText="pid" SortExpression="pid" />
                <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="discount" HeaderText="discount" SortExpression="discount" />
                <asp:BoundField DataField="netprice" HeaderText="netprice" SortExpression="netprice" />
                <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
                <asp:BoundField DataField="totalamount" HeaderText="totalamount" SortExpression="totalamount" />
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
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" DeleteCommand="DELETE FROM [bill] WHERE [billid] = @billid" InsertCommand="INSERT INTO [bill] ([name], [emailid], [mobileno], [dateofbill], [address], [billamount], [paymentmode], [status]) VALUES (@name, @emailid, @mobileno, @dateofbill, @address, @billamount, @paymentmode, @status)" SelectCommand="SELECT billid, name, emailid, mobileno, dateofbill, address, billamount, paymentmode, status FROM bill WHERE (status &lt;&gt; 'Pending' ) AND (emailid = @emailid)" UpdateCommand="UPDATE [bill] SET  [status] = @status WHERE [billid] = @billid">
        <DeleteParameters>
            <asp:Parameter Name="billid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="emailid" Type="String" />
            <asp:Parameter Name="mobileno" Type="String" />
            <asp:Parameter Name="dateofbill" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="billamount" Type="Int32" />
            <asp:Parameter Name="paymentmode" Type="String" />
            <asp:Parameter Name="status" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="emailid" SessionField="email" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="HiddenField_status" Name="status" PropertyName="Value" />
            <asp:ControlParameter ControlID="HiddenField_billid" Name="billid" PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2_details" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" SelectCommand="SELECT * FROM [billdetails] WHERE ([billid] = @billid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField_billid" Name="billid" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField_billid" runat="server" />
    </asp:Content>
