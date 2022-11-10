using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class placeorder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["address"] != null)
            {
                tbaddress.Text = Session["address"].ToString();
                tbbillamount.Text = Session["totalbill"].ToString();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(RadioButtonList1.SelectedIndex==0) //cod logic
            {
                HiddenField1_billdate.Value = DateTime.Today.ToLongDateString();
                SqlDataSource1_bill.Insert();

                List<ShoppingCart> cartlist = (List<ShoppingCart>)Session["cartlist"];
                foreach(ShoppingCart cart in cartlist)
                {
                    HiddenField1_pid.Value = cart.Pid.ToString();
                    HiddenField1_pname.Value = cart.Pname.ToString();
                    HiddenField1_price.Value = cart.Price.ToString();
                    HiddenField1_discount.Value = cart.Discount.ToString();
                    HiddenField1_netprice.Value = cart.NetPrice.ToString();
                    HiddenField1_qty.Value = cart.Qty.ToString();
                    HiddenField1_totalamount.Value = cart.TotalAmount.ToString();
                    SqlDataSource1_billdetails.Insert();
                }
                Response.Redirect("orderplaced.aspx");
            }
            else
            {
                Session["deladdress"] = tbaddress.Text;
                //online payment logic
                Response.Redirect("Payment.aspx");
            }
        }

        protected void SqlDataSource1_bill_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
          HiddenField1_billid.Value =   e.Command.Parameters["@billid"].Value.ToString();
        }
    }
}