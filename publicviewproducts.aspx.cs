using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class publicviewproducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Page.IsPostBack==false)
            {
                DataList1.DataSource = SqlDataSource1_all;
                DataList1.DataBind();
            }
        }

        protected void rblmaincategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblmaincategory.SelectedIndex == 0)
            {
                DataList1.DataSource = SqlDataSource1_all;
                DataList1.DataBind();
            }
            else
            {
                DataList1.DataSource = SqlDataSource1_maincategory;
                DataList1.DataBind();
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            if(rblmaincategory.SelectedIndex==0)
            {
                DataList1.DataSource = SqlDataSource1_searchall;
                DataList1.DataBind();
            }
            else
            {
                HiddenField1_search.Value = rblmaincategory.SelectedValue;
                DataList1.DataSource = SqlDataSource1_searchcat;
                DataList1.DataBind();
            }
        }
    }
}