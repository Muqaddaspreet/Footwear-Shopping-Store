using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class cutomer_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if(Session["email"] != null)
            {
                lblwelcome.Text = "Welcome, " + Session["email"];
            }
            
        }
    }
}