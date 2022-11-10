using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class coustomersignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            bool flag = false;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            for (int i = 0; i <= dv.Table.Rows.Count - 1; i++)
            {
                if (dv.Table.Rows[i]["emailid"].ToString().ToLower() == tbemail.Text.ToLower())
                {
                    flag = true;
                    break;
                }
            }

            if (flag == true)
            {
                lblmsg.Text = "Duplicate Emaild Id";
            }
            else
            {
                string filename = FileUpload1.FileName.ToLower();
                if (filename.EndsWith(".jpg") || filename.EndsWith(".png"))
                {
                    FileUpload1.SaveAs(Server.MapPath("uploads/" + filename));
                    HiddenField1_path.Value = "uploads/" + filename;
                    SqlDataSource1.Insert();
                    Response.Redirect("signup_success.aspx");
                }
                else
                {
                    lblmsg.Text = "Invlaid photo file";
                }
            }
        }

        
    }
}