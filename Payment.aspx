<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="RazorpaySampleApp.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function startpayment() {
            rzp1.open(); e.preventDefault();
        }
    </script>
</head>
<body onload="startpayment()">
    <form action="#" method="post" runat="server">
     

        <input type="hidden" name="hidden" />
        <asp:HiddenField ID="HiddenField_amount"  runat="server" />
        <asp:HiddenField ID="HiddenField_name" runat="server" />
        <asp:HiddenField ID="HiddenField_email" runat="server" />
        <asp:HiddenField ID="HiddenField_mobile" runat="server" />

           <button id="rzp-button1" style="visibility: hidden;">Pay</button>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
            var options =
            {
                "key": "rzp_test_dRWiKHS7zr2Gki", // Enter the Key ID generated from the Dashboard
                "amount": parseInt(document.getElementById("HiddenField_amount").value) * 100, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise    
                "currency": "INR",
                "name": "Footware Store",
                "description": "Billing Amount",
                "image": "https://example.com/your_logo",
                "order_id": "", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
                "handler": function (response) {
                    alert("Payment Success");
                    window.location.href = "placeorder_online.aspx";
                },
                "prefill":
                {
                    "name": document.getElementById("HiddenField_name").value,
                    "email": document.getElementById("HiddenField_email").value,
                    "contact": document.getElementById("HiddenField_mobile").value
                },
                "notes":
                {
                    "address": ""
                },
                "theme":
                {
                    "color": "#F37254"
                }
            }; var rzp1 = new Razorpay(options);
            document.getElementById('rzp-button1').onclick =
                function (e) {
                    rzp1.open(); e.preventDefault();
                }

        </script>
    </form>

</body>
</html>
