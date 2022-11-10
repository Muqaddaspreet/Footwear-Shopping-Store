using Razorpay.Api;
using System;
using System.Collections.Generic;
using Newtonsoft;
namespace RazorpaySampleApp
{
    public partial class Payment : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["email"] !=null)
            {
                HiddenField_email.Value = Session["email"].ToString();
                HiddenField_name.Value = Session["name"].ToString();
                HiddenField_mobile.Value = Session["mobileno"].ToString();
                HiddenField_amount.Value = Session["totalbill"].ToString();
            }


        }
    }
}