<%@ Page Title="" Language="C#" MasterPageFile="~/customer_view.Master" AutoEventWireup="true" CodeBehind="editcustomerprofile.aspx.cs" Inherits="footwarestore.editcustomerprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 566px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-bordered">
        <tr>
            <td class="auto-style1">Email Id</td>
            <td>
                <asp:TextBox ID="tbemail" placeholder="Enter Email id" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Full Name</td>
            <td>
                <asp:TextBox ID="tbfullname" placeholder="Enter Full Name" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbfullname" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Fullname is must" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Address</td>
            <td>
                <asp:TextBox ID="tbaddress" placeholder="Enter address" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>

            <asp:RequiredFieldValidator ControlToValidate="tbaddress" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Address is must" Display="Dynamic"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">Mobile No.</td>
            <td>
                <asp:TextBox ID="tbmobileno" placeholder="Enter Mobileno(10 Digit)" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbmobileno" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Mobileno is must" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid mobile no." ControlToValidate="tbmobileno" CssClass="text-danger" Display="Dynamic" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Gender</td>
            <td>
                <asp:RadioButtonList ID="rblgender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>

                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Photo</td>
            <td>
                <asp:Image ID="Image1" runat="server" Height="92px" Width="105px" />
                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" /></td>
        </tr>
        <tr>
            <td class="auto-style1">Security Question</td>
            <td>
                <asp:DropDownList ID="ddlquestion" CssClass="form-control" runat="server">
                    <asp:ListItem Selected="True">What is your favourite color?</asp:ListItem>
                    <asp:ListItem>What is your city of birth?</asp:ListItem>
                    <asp:ListItem>What is your pet&#39;s name?</asp:ListItem>
                    <asp:ListItem>Your favourite movie star?</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Answer</td>
            <td>
                <asp:TextBox ID="tbanswer" placeholder="Enter Answer" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="tbanswer" CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Answer is must" Display="Dynamic"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:footwaredbconstring %>" DeleteCommand="DELETE FROM [customersignup] WHERE [emailid] = @emailid" InsertCommand="INSERT INTO [customersignup] ([emailid], [password], [fullname], [address], [mobileno], [gender], [photo], [question], [answer]) VALUES (@emailid, @password, @fullname, @address, @mobileno, @gender, @photo, @question, @answer)" SelectCommand="SELECT * FROM [customersignup]" UpdateCommand="UPDATE [customersignup] SET  [fullname] = @fullname, [address] = @address, [mobileno] = @mobileno, [gender] = @gender, [photo] = @photo, [question] = @question, [answer] = @answer WHERE [emailid] = @emailid">
                    <DeleteParameters>
                        <asp:Parameter Name="emailid" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="emailid" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="fullname" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="mobileno" Type="String" />
                        <asp:Parameter Name="gender" Type="String" />
                        <asp:Parameter Name="photo" Type="String" />
                        <asp:Parameter Name="question" Type="String" />
                        <asp:Parameter Name="answer" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="tbfullname" Name="fullname" PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbaddress" Name="address" PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbmobileno" Name="mobileno" PropertyName="Text" />
                        <asp:ControlParameter ControlID="rblgender" Name="gender" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="HiddenField1_photo" Name="photo" PropertyName="Value" />
                        <asp:ControlParameter ControlID="ddlquestion" Name="question" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tbanswer" Name="answer" PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbemail" Name="emailid" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnsubmit_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:HiddenField ID="HiddenField1_photo" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
