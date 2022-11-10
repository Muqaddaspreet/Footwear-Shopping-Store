using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class viewproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rblmaincategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        }
    }
}