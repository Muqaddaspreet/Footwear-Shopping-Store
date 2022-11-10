using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btlogin_Click(object sender, EventArgs e)
        {
            bool flag = false;
            string email = tbemail.Text;
            string password = tbpass.Text;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            for (int i = 0; i <= dv.Table.Rows.Count - 1; i++)
            {
                if (dv.Table.Rows[i]["emailid"].ToString().ToLower() == email.ToLower() &&
                    dv.Table.Rows[i]["password"].ToString() == password)
                {
                    flag = true;
                    break;
                }
            }

            if (flag == false)
            {
                lblmsg.Text = "Login Failed!!!";
            }
            else
            {
                Session["adminemail"] = email;
                Response.Redirect("admin_home.aspx");
            }

        }
    }
}