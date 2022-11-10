using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;

namespace footwarestore
{
    public partial class publicproductdetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (dv.Table.Rows.Count > 0)
                {

                    categoryLabel.Text = dv.Table.Rows[0]["category"].ToString();
                    productnameLabel.Text = dv.Table.Rows[0]["productname"].ToString();
                    descriptionLabel.Text = dv.Table.Rows[0]["description"].ToString();
                    priceLabel.Text = dv.Table.Rows[0]["price"].ToString();
                    discountLabel.Text = dv.Table.Rows[0]["discount"].ToString();
                    netpriceLabel.Text = dv.Table.Rows[0]["netprice"].ToString();
                    brandLabel.Text = dv.Table.Rows[0]["brand"].ToString();
                    Image_topview.ImageUrl = dv.Table.Rows[0]["topphoto"].ToString();
                    Image_bottomview.ImageUrl = dv.Table.Rows[0]["bottomphoto"].ToString();
                    if (dv.Table.Rows[0]["status"].ToString() == "true")
                    {
                        lblstatus.Text = "In Stock";
                        Button1.Enabled = true;
                    }
                    else
                    {
                        lblstatus.Text = "Out of Stock";
                        Button1.Enabled = false;
                    }
                    string productsizes = dv.Table.Rows[0]["sizes"].ToString();
                    string[] sizes = productsizes.Substring(0, productsizes.Length - 1).Split(',');
                    foreach (string size in sizes)
                        rblsize.Items.Add(size);

                    if(rblsize.Items.Count>0)
                    {
                        rblsize.SelectedIndex = 0;
                    }


                }
            }
        }
        List<ShoppingCart> cartlist = null;
        protected void Button1_Click(object sender, EventArgs e)
        {
            ShoppingCart cartobj = new ShoppingCart()
            {
                Pid = Convert.ToInt32(Request.QueryString["pid"]),
                Pname = productnameLabel.Text,
                Category = categoryLabel.Text,
                Price = Convert.ToInt32(priceLabel.Text),
                Discount = Convert.ToInt32(discountLabel.Text),
                NetPrice = Convert.ToInt32(netpriceLabel.Text),
                Qty = Convert.ToInt32(ddlqty.SelectedValue),
                Photo = Image_topview.ImageUrl,
                TotalAmount = Convert.ToInt32(netpriceLabel.Text) * Convert.ToInt32(ddlqty.SelectedValue)
            };

            if (Session["cartlist"] == null)
            {
                cartlist = new List<ShoppingCart>();
            }
            else
            {
                cartlist = (List<ShoppingCart>)Session["cartlist"];
            }
            bool flag = false;
            foreach(ShoppingCart obj in cartlist)
            {
                if(obj.Pid == cartobj.Pid)
                {
                    flag = true;
                    break;
                }
            }
            if (flag == false)
            {
                cartlist.Add(cartobj);
                Session["cartlist"] = cartlist;
                lblmsg.Text = "Item added into cart";
                Page_Load(null, null);
            }
            else
            {
                lblmsg.Text = "Item already in cart";
            }
        }
    }
}