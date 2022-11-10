using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class editcustomerprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false && Session["email"] != null)
            {
                string emailid = Session["email"].ToString();
                tbemail.Text = emailid;
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                for (int i = 0; i <= dv.Table.Rows.Count - 1; i++)
                {
                    if (dv.Table.Rows[i]["emailid"].ToString() == emailid)
                    {
                        tbfullname.Text = dv.Table.Rows[i]["fullname"].ToString();
                        tbaddress.Text = dv.Table.Rows[i]["address"].ToString();
                        tbmobileno.Text = dv.Table.Rows[i]["mobileno"].ToString();
                        rblgender.SelectedValue = dv.Table.Rows[i]["gender"].ToString();
                        ddlquestion.SelectedValue = dv.Table.Rows[i]["question"].ToString();
                        tbanswer.Text = dv.Table.Rows[i]["answer"].ToString();
                        Image1.ImageUrl = dv.Table.Rows[i]["photo"].ToString();
                        HiddenField1_photo.Value = dv.Table.Rows[i]["photo"].ToString();
                        break;
                    }
                }
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile == true) //user selected new file
            {
                String filename = FileUpload1.FileName.ToLower();
                if (filename.EndsWith(".jpg") || filename.EndsWith(".png"))
                {
                    FileUpload1.SaveAs(Server.MapPath("uploads/" + filename));
                    HiddenField1_photo.Value = "uploads/" + filename;
                    SqlDataSource1.Update();
                    Response.Redirect("profileupdated.aspx");
                }
                else
                {
                    lblmsg.Text = "Invalid photo file";
                }
            }//user don't selected file
            else
            {
                SqlDataSource1.Update();
                Response.Redirect("profileupdated.aspx");
            }
        }
    }
}