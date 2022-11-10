using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace footwarestore
{
    public class ShoppingCart
    {
        public int Pid { get; set; }
        public string Pname { get; set; }
        public string Category { get; set; }
        public int Qty { get; set; }
        public int Price { get; set; }
        public int Discount { get; set; }
        public int NetPrice { get; set; }
        public int TotalAmount { get; set; }
        public string Photo { get; set; }


        public DataSet getCart()
        {
            DataTable dt = new DataTable("cartdata");
            dt.Columns.Add("Photo");
            dt.Columns.Add("Pid");
            dt.Columns.Add("Pname");
            dt.Columns.Add("Category");
            dt.Columns.Add("Price");
            dt.Columns.Add("Discount");
            dt.Columns.Add("NetPrice");
            dt.Columns.Add("Qty");
            dt.Columns.Add("TotalAmount");

            List<ShoppingCart> cartlist = (List<ShoppingCart>)HttpContext.Current.Session["cartlist"];

            if (cartlist.Count > 0)
            {
                foreach (ShoppingCart obj in cartlist)
                {
                    DataRow dr = dt.NewRow();
                    dr[0] = obj.Photo;
                    dr[1] = obj.Pid;
                    dr[2] = obj.Pname;
                    dr[3] = obj.Category;
                    dr[4] = obj.Price;
                    dr[5] = obj.Discount;
                    dr[6] = obj.NetPrice;
                    dr[7] = obj.Qty;
                    dr[8] = obj.TotalAmount;

                    dt.Rows.Add(dr);
                }
            }
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            return ds;
        }

    }
}