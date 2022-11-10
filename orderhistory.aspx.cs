using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class orderhistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            HiddenField_billid.Value = e.CommandName;
            SqlDataSource2_details.Select(DataSourceSelectArguments.Empty);
        }
    }
}