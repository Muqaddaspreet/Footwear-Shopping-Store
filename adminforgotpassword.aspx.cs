using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class adminforgotpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string email = tbemail.Text;

            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            bool flag = false;
            for (int i = 0; i <= dv.Table.Rows.Count - 1; i++)
            {
                if (dv.Table.Rows[i]["emailid"].ToString().ToLower() == email)
                {
                    flag = true;
                    break;
                }
            }
            if (flag == false)
            {
                lblmsg.Text = "Invalid Email id";
            }
            else
            {
                //generate a random password
                String password = System.Web.Security.Membership.GeneratePassword(6, 0);
                HiddenField1_pass.Value = password;
                MailMessage mailmsg = new MailMessage();
                mailmsg.To.Add(email);
                mailmsg.From = new MailAddress("vmm.students2010@gmail.com");
                mailmsg.Subject = "Admin Password Recovery For Footware Store";
                mailmsg.Body = "Your new password is : " + password;

                SmtpClient mailclient = new SmtpClient();
                mailclient.Host = "smtp.gmail.com";
                mailclient.Port = 587;
                mailclient.EnableSsl = true;
                mailclient.Credentials = new System.Net.NetworkCredential("vmm.students2010@gmail.com", "HelloWorld009");
                try
                {
                    mailclient.Send(mailmsg);
                    SqlDataSource1.Update();
                    lblmsg.Text = "Check your mail for new password";
                }
                catch (Exception ex)
                {
                    lblmsg.Text = ex.Message;
                }

            }
        }
    }
}