using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class orderplaced : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblmsg.Text = "You order having amount " + Session["totalbill"] + " placed successfully.<br/> You can check order status from you Dashboard.";
            Session["totalbill"] = null;
            Session["cartlist"] = null;
        }
    }
}