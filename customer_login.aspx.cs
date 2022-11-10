using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class customer_login : System.Web.UI.Page
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
            string status = "";
            for(int i=0;i<= dv.Table.Rows.Count - 1;i++)
            {
                if(dv.Table.Rows[i]["emailid"].ToString().ToLower() == email.ToLower() &&
                    dv.Table.Rows[i]["password"].ToString() == password)
                {
                    Session["name"] = dv.Table.Rows[i]["fullname"];
                    Session["address"] = dv.Table.Rows[i]["address"];
                    Session["mobileno"] = dv.Table.Rows[i]["mobileno"];
                    status = dv.Table.Rows[i]["status"].ToString();
                    flag = true;
                    break;
                }
            }

            if(flag==false)
            {
                lblmsg.Text = "Login Failed!!!";
            }
            else if(status=="Inactive")
            {
                lblmsg.Text = "You account is blocked, contact admin";
            }
            else
            {
                Session["email"] = email;
                if (Session["totalbill"] != null)
                {
                    Response.Redirect("placeorder.aspx");
                }
                else
                {
                    Response.Redirect("cutomer_home.aspx");
                }
            }

        }
    }
}