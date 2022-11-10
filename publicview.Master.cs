using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class publicview : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cartlist"] != null)
            {
                List<ShoppingCart> cart = (List<ShoppingCart>)Session["cartlist"];
                hl_cartcount.Text = cart.Count.ToString();
            }
        }
    }
}