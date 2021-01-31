using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class AddQuestion : System.Web.UI.Page
{
    public SqlConnection cn;
    public int val;
    int max;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();
        FormView1.ChangeMode(FormViewMode.Insert);
    }

    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox sub_txt;
        sub_txt = (TextBox)FormView1.FindControl("Subject_IdTextBox3");
        DropDownList sub_dr;
        sub_dr = (DropDownList)FormView1.FindControl("DropDownList5");

        sub_txt.Text = sub_dr.SelectedValue;
    }

    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox chapterTxt;
        chapterTxt = (TextBox)FormView1.FindControl("Chapter_IdTextBox3");
        DropDownList ChDr;
        ChDr = (DropDownList)FormView1.FindControl("DropDownList6");

        chapterTxt.Text = ChDr.SelectedValue;
    }
    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT MAX(Question_Id) FROM Question_Bank";
        cmd.Connection = cn;
        val = Convert.ToInt32(cmd.ExecuteScalar());
        
        
        Response.Redirect("~/ADMIN_/Add_Option.aspx?qid=" + val);
    }
}