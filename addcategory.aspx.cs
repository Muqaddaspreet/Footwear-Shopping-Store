using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class addcategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string maincategory = ddlmaincategory.SelectedValue;
            string category = tbcategory.Text.ToLower();
            bool flag = false;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            for(int i=0;i<=dv.Table.Rows.Count-1;i++)
            {
                if(dv.Table.Rows[i]["maincategory"].ToString() == maincategory&&
                   dv.Table.Rows[i]["category"].ToString().ToLower() == category )
                {
                    flag = true;
                    break;
                }
            }
            if (flag == true)
                lblmsg.Text = "Duplicate Category";
            else
            {
                SqlDataSource1.Insert();
                Response.Redirect("viewcategory.aspx");
            }
        }
    }
}