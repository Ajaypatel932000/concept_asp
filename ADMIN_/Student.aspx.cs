using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class ADMIN_Student : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True");
        cn.Open();
        Panel1.Visible = true;
        Panel2.Visible = false;
       // Panel3.Visible = false;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        cmd = new SqlCommand();
        cmd.CommandText = "SELECT Batch_Id, Batch_Name FROM Batch WHERE Batch_Id IN (SELECT Batch_Id FROM Enrollment WHERE YEAR(EDate) = " + DropDownList1.SelectedValue + " AND Standard_Id =" + DropDownList2.SelectedValue + ") OR (Batch_Id = 0)";
        cmd.Connection = cn;
        SqlDataReader dr;
        dr = cmd.ExecuteReader();

        DropDownList3.Items.Add("SELECT");
        while (dr.Read())
        {
            ListItem lst = new ListItem();
            lst.Text = dr.GetValue(1).ToString();
            lst.Value = dr.GetValue(0).ToString();
            DropDownList3.Items.Add(lst);
        }
        dr.Close();
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        //Panel3.Visible = false;
    }
   
}