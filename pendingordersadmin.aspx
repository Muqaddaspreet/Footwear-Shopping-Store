<%@ Page Title="" Language="C#" MasterPageFile="~/adminview.Master" AutoEventWireup="true" CodeBehind="pendingordersadmin.aspx.cs" Inherits="footwarestore.pendingordersadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function validate() {
            return confirm("Are you sure?");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <h1>Pending Orders</h1>
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
                        <asp:Button ID="Button1" runat="server" OnCommand="Button1_Command" CausesValidation="false" CommandArgument='<%# Eval("emailid") %>' CommandName='<%# Eval("billid") %>' OnClientClick="return validate()" Text="Cancel" />
                    </ItemTemplate>
                    <ControlStyle CssClass="btn btn-danger" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button2" runat="server" OnCommand="Button2_Command" CausesValidation="false" CommandArgument='<%# Eval("emailid") %>' CommandName='<%# Eval("billid") %>' OnClientClick="return validate()" Text="Confirm" />
                    </ItemTemplate>
                    <ControlStyle CssClass="btn btn-success" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" DeleteCommand="DELETE FROM [bill] WHERE [billid] = @billid" InsertCommand="INSERT INTO [bill] ([name], [emailid], [mobileno], [dateofbill], [address], [billamount], [paymentmode], [status]) VALUES (@name, @emailid, @mobileno, @dateofbill, @address, @billamount, @paymentmode, @status)" SelectCommand="SELECT * FROM [bill] WHERE ([status] = @status)" UpdateCommand="UPDATE [bill] SET  [status] = @status WHERE [billid] = @billid">
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
            <asp:Parameter DefaultValue="pending" Name="status" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="HiddenField_status" Name="status" PropertyName="Value" />
            <asp:ControlParameter ControlID="HiddenField_billid" Name="billid" PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField_billid" runat="server" />
    <asp:HiddenField ID="HiddenField_status" runat="server" />
</asp:Content>
