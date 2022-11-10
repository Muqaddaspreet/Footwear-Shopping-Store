using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class publicviewcart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {




        }

        int totalamount = 0;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e != null && e.Row.RowType == DataControlRowType.DataRow)
            {
                totalamount += Convert.ToInt32(e.Row.Cells[8].Text);
            }
           
            lbltotal.Text = totalamount.ToString();
         
            
        }

       
        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            int pid = Convert.ToInt32(e.CommandArgument);
            List<ShoppingCart> cartlist = (List<ShoppingCart>)Session["cartlist"];
            cartlist.RemoveAll(x => x.Pid == pid);
            Session["cartlist"] = cartlist;
            GridView1_RowDataBound(null, null);
            Response.Redirect("publicviewcart.aspx",true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<ShoppingCart> cartlist = (List<ShoppingCart>)Session["cartlist"];
            int totalbill = 0;
            if(cartlist.Count>0)
            {
                foreach(ShoppingCart obj in cartlist)
                {
                    totalbill += obj.TotalAmount;
                }
                Session["totalbill"] = totalbill;
                //check if the user is already logged in 
                if(Session["email"] ==null)
                {
                    Response.Redirect("customer_login.aspx");
                }
                else
                {
                    Response.Redirect("placeorder.aspx");
                }
            }
            else
            {
                lblmsg.Text = "Cart is emtpy!!";
            }
        }
    }
}