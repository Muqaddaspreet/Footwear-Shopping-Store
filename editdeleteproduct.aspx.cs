using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace footwarestore
{
    public partial class editdeleteproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                for (int dis = 0; dis <= 80; dis += 5)
                {
                    ddldiscount.Items.Add(dis.ToString());
                }

                string pid = Request.QueryString["pid"];
                tbpid.Text = pid;

                DataView dv = (DataView)SqlDataSource1_product.Select(DataSourceSelectArguments.Empty);
                for (int i = 0; i <= dv.Table.Rows.Count - 1; i++)
                {
                    if (dv.Table.Rows[i]["productid"].ToString() == pid)
                    {
                        rblmaincategory.SelectedValue = dv.Table.Rows[i]["main_category"].ToString();
                        ddlcategory.SelectedValue = dv.Table.Rows[i]["category"].ToString();
                        tbpname.Text = dv.Table.Rows[i]["productname"].ToString();
                        tbdesc.Text = dv.Table.Rows[i]["description"].ToString();
                        ddlbrand.SelectedValue = dv.Table.Rows[i]["brand"].ToString();
                        tbprice.Text = dv.Table.Rows[i]["price"].ToString();
                        ddldiscount.SelectedValue = dv.Table.Rows[i]["discount"].ToString();
                        tbnetprice.Text = dv.Table.Rows[i]["netprice"].ToString();
                        Image1_top.ImageUrl = dv.Table.Rows[i]["topphoto"].ToString();
                        HiddenField1_topview.Value = dv.Table.Rows[i]["topphoto"].ToString();
                        Image2_bottom.ImageUrl = dv.Table.Rows[i]["bottomphoto"].ToString();
                        HiddenField3_bottomview.Value = dv.Table.Rows[i]["bottomphoto"].ToString();
                        rblstatus.SelectedValue = dv.Table.Rows[i]["status"].ToString();

                        string[] sizes = dv.Table.Rows[i]["sizes"].ToString().Split(',');
                        rblmaincategory_SelectedIndexChanged(null, null);
                        for (int j = 0; j <= sizes.Length - 1; j++)
                        {
                            for (int k = 0; k <= chksizes.Items.Count - 1; k++)
                            {
                                if (sizes[j] == chksizes.Items[k].Value)
                                {
                                    chksizes.Items[k].Selected = true;
                                    break;
                                }
                            }
                        }
                        break;
                    }
                }
            }
        }

        protected void rblmaincategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1_category.Select(DataSourceSelectArguments.Empty);
            chksizes.Items.Clear();
            if (rblmaincategory.SelectedIndex == 0) //men
            {
                for (int size = 5; size <= 11; size++)
                    chksizes.Items.Add(size.ToString());
            }
            else if (rblmaincategory.SelectedIndex == 1)//women
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

        protected void btndelete_Click(object sender, EventArgs e)
        {
            SqlDataSource1_product.Delete();
            Response.Redirect("viewproduct.aspx");
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            //top photo change check
            if(fu_topview.HasFile)
            {
                string topviewphoto = fu_topview.FileName.ToLower();
                if (topviewphoto.EndsWith("jpg") || topviewphoto.EndsWith("bmp"))
                {
                    fu_topview.SaveAs(Server.MapPath("photos/" + topviewphoto));
                    HiddenField1_topview.Value = "photos/" + topviewphoto;
                }
                else
                {
                    lblmsg.Text = "Invalid Top View Photo";
                    return;
                }
            }
            //bottom photo change check
            if (fu_bottomview.HasFile)
            {
                string bottomviewphoto = fu_bottomview.FileName.ToLower();

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
            }

            string selected_sizes = "";
            for (int i = 0; i <= chksizes.Items.Count - 1; i++)
            {
                if (chksizes.Items[i].Selected == true)
                {
                    selected_sizes += chksizes.Items[i].Value + ",";
                }
            }

            HiddenField2_sizes.Value = selected_sizes;
            SqlDataSource1_product.Update();
            Response.Redirect("viewproduct.aspx");




        }
    }
}