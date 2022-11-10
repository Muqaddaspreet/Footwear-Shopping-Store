<%@ Page Title="" Language="C#" MasterPageFile="~/adminview.Master" AutoEventWireup="true" CodeBehind="editdeleteproduct.aspx.cs" Inherits="footwarestore.editdeleteproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table class="w-100">
        <tr>
            <td>Product Id</td>
            <td>
                <asp:TextBox ID="tbpid" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Main Category</td>
            <td>
                <asp:RadioButtonList ID="rblmaincategory" runat="server" CssClass="form-control" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblmaincategory_SelectedIndexChanged">
                    <asp:ListItem>Men</asp:ListItem>
                    <asp:ListItem>Women</asp:ListItem>
                    <asp:ListItem>Kids</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>Category</td>
            <td>
                <asp:DropDownList ID="ddlcategory" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1_category" DataTextField="category" DataValueField="category">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Product Name</td>
            <td>
                <asp:TextBox ID="tbpname" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Description</td>
            <td>
                <asp:TextBox ID="tbdesc" runat="server" CssClass="form-control" Rows="5" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Sizes</td>
            <td>
                <asp:CheckBoxList ID="chksizes" runat="server" CssClass="form-control" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>Brand</td>
            <td>
                <asp:DropDownList ID="ddlbrand" runat="server" CssClass="form-control">
                    <asp:ListItem>Nike</asp:ListItem>
                    <asp:ListItem Value="Adidas"></asp:ListItem>
                    <asp:ListItem Value="Puma"></asp:ListItem>
                    <asp:ListItem>Action</asp:ListItem>
                    <asp:ListItem>Campus</asp:ListItem>
                    <asp:ListItem>Liberty</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Price</td>
            <td>
                <asp:TextBox ID="tbprice" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </td>
        </tr>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>
                <tr>
                    <td>Discount %</td>
                    <td>
                        <asp:DropDownList ID="ddldiscount" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddldiscount_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Net Price</td>
                    <td>
                        <asp:TextBox ID="tbnetprice" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
            </ContentTemplate>
        </asp:UpdatePanel>
        <tr>
            <td>Top View Photo</td>
            <td>
                <asp:Image ID="Image1_top" runat="server" Height="94px" Width="115px" />
                <asp:FileUpload ID="fu_topview" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>Bottom View Photo</td>
            <td>
                <asp:Image ID="Image2_bottom" runat="server" Height="94px" Width="115px" />
                <asp:FileUpload ID="fu_bottomview" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>Product Status</td>
            <td>
                <asp:RadioButtonList ID="rblstatus" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>true</asp:ListItem>
                    <asp:ListItem Value="false"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnedit" runat="server" CssClass="btn btn-success" Text="Edit Product" OnClick="btnedit_Click" />
                <asp:Button ID="btndelete" runat="server" CssClass="btn btn-danger" Text="Delete Product" OnClick="btndelete_Click" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1_category" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" SelectCommand="SELECT [category] FROM [category] WHERE ([maincategory] = @maincategory)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="rblmaincategory" Name="maincategory" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="HiddenField1_topview" runat="server" />
                <asp:HiddenField ID="HiddenField3_bottomview" runat="server" />
                <asp:SqlDataSource ID="SqlDataSource1_product" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" DeleteCommand="DELETE FROM [product] WHERE [productid] = @productid" InsertCommand="INSERT INTO [product] ([main_category], [category], [productname], [description], [sizes], [brand], [price], [discount], [netprice], [topphoto], [bottomphoto], [status]) VALUES (@main_category, @category, @productname, @description, @sizes, @brand, @price, @discount, @netprice, @topphoto, @bottomphoto, @status)" SelectCommand="SELECT * FROM [product]" UpdateCommand="UPDATE [product] SET [main_category] = @main_category, [category] = @category, [productname] = @productname, [description] = @description, [sizes] = @sizes, [brand] = @brand, [price] = @price, [discount] = @discount, [netprice] = @netprice, [topphoto] = @topphoto, [bottomphoto] = @bottomphoto, [status] = @status WHERE [productid] = @productid">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="tbpid" Name="productid" PropertyName="Text" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="main_category" Type="String" />
                        <asp:Parameter Name="category" Type="String" />
                        <asp:Parameter Name="productname" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="sizes" Type="String" />
                        <asp:Parameter Name="brand" Type="String" />
                        <asp:Parameter Name="price" Type="Int32" />
                        <asp:Parameter Name="discount" Type="Int32" />
                        <asp:Parameter Name="netprice" Type="Int32" />
                        <asp:Parameter Name="topphoto" Type="String" />
                        <asp:Parameter Name="bottomphoto" Type="String" />
                        <asp:Parameter Name="status" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="rblmaincategory" Name="main_category" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlcategory" Name="category" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="tbpname" Name="productname" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="tbdesc" Name="description" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField2_sizes" Name="sizes" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="ddlbrand" Name="brand" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="tbprice" Name="price" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="ddldiscount" Name="discount" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="tbnetprice" Name="netprice" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="HiddenField1_topview" Name="topphoto" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField3_bottomview" Name="bottomphoto" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="rblstatus" Name="status" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="tbpid" Name="productid" PropertyName="Text" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="HiddenField2_sizes" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
