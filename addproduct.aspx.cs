using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class addproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Page.IsPostBack==false)
            {
                for(int dis=0;dis<=80;dis+=5)
                {
                    ddldiscount.Items.Add(dis.ToString());
                }
            }
        }

        protected void rblmaincategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1_category.Select(DataSourceSelectArguments.Empty);
            chksizes.Items.Clear();
            if(rblmaincategory.SelectedIndex==0) //men
            {
                for (int size = 5; size <= 11; size++)
                    chksizes.Items.Add(size.ToString());
            }
            else if(rblmaincategory.SelectedIndex==1)//women
            {

                for (int size = 36; size <= 41; size++)
                    chksizes.Items.Add(size.ToString());
            }
            else //kids
            {

                for (int size = 25; size <= 30; size++)
                    chksizes.Items.Add(size.ToString());
            }
        }

        protected void ddldiscount_SelectedIndexChanged(object sender, EventArgs e)
        {
            int price = Convert.ToInt32(tbprice.Text);
            int dis_per = Convert.ToInt32(ddldiscount.SelectedValue);
            int discount_value = (price * dis_per) / 100;
            int netprice = price - discount_value;
            tbnetprice.Text = netprice.ToString();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string topviewphoto = fu_topview.FileName.ToLower();
            string bottomviewphoto = fu_bottomview.FileName.ToLower();
            
            if(topviewphoto.EndsWith("jpg")  || topviewphoto.EndsWith("bmp") )
            {
                fu_topview.SaveAs(Server.MapPath("photos/" + topviewphoto));
                HiddenField1_topview.Value = "photos/" + topviewphoto;

            }
            else
            {
                lblmsg.Text = "Invalid Top View Photo";
                return;

            }
            if (bottomviewphoto.EndsWith(".jpg") || bottomviewphoto.EndsWith(".bmp"))
            {

                fu_bottomview.SaveAs(Server.MapPath("photos/" + bottomviewphoto));
                HiddenField3_bottomview.Value = "photos/" + bottomviewphoto;
            }
            else 
            { 
                lblmsg.Text = "Invalid Bottom View Photo";
                return;
            }

            string selected_sizes = "";
            for(int i=0;i<=chksizes.Items.Count-1;i++)
            {
                if(chksizes.Items[i].Selected == true)
                {
                    selected_sizes += chksizes.Items[i].Value + ",";
                }
            }

            HiddenField2_sizes.Value = selected_sizes;
           
            SqlDataSource1_product.Insert();

            lblmsg.Text = "Product Added";

            


        }
    }
}