using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class uservieworders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //cancel
        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            string billid = e.CommandName;
            string email = e.CommandArgument.ToString();
            HiddenField_status.Value = "Cancel";
            HiddenField_billid.Value = billid;
            SqlDataSource1.Update();
            string message = "Your order having order id " + billid + " canceled successfully!!";
            sendemail(email, message);
        }

       
        void sendemail(string email, string message)
        {

            MailMessage mailmsg = new MailMessage();
            mailmsg.To.Add(email);
            mailmsg.From = new MailAddress("vmm.students2010@gmail.com");
            mailmsg.Subject = "Your order status for footware store.";
            mailmsg.Body = message;

            SmtpClient mailclient = new SmtpClient();
            mailclient.Host = "smtp.gmail.com";
            mailclient.Port = 587;
            mailclient.EnableSsl = true;
            mailclient.Credentials = new System.Net.NetworkCredential("vmm.students2010@gmail.com", "HelloWorld009");
            try
            {
                mailclient.Send(mailmsg);
            }
            catch (Exception ex)
            {

            }
        }
    }
}