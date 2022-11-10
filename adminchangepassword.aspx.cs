using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class adminchangepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string email = Session["adminemail"].ToString();
            string oldpass = tboldpass.Text; //existing password

            bool flag = false;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            for (int i = 0; i <= dv.Table.Rows.Count - 1; i++)
            {
                if (dv.Table.Rows[i]["emailid"].ToString() == email &&
                    dv.Table.Rows[i]["password"].ToString() == oldpass)
                {
                    flag = true;
                    break;
                }
            }
            if (flag == false)
            {
                lblmsg.Text = "Invalid old password";
            }
            else
            {
                SqlDataSource1.Update();
                Response.Redirect("admin_login.aspx");
            }
        }
    }
}