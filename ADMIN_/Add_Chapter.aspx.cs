using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Add_Chapter : System.Web.UI.Page
{
    SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True");
        cn.Open();
        lblMessage.Visible = false;
        Label4.Visible = false;


    }
   
   
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Label4.Visible = true;
            return;
        }

        string sql = "SELECT CHAPTER_ID FROM CHAPTER WHERE CHAPTER_NAME LIKE '" + TextBox1.Text + "'AND SUBJECT_ID =" + DropDownList2.SelectedValue;

        SqlCommand findValue = new SqlCommand(sql, cn);
        int found = Convert.ToInt32(findValue.ExecuteScalar());
        bool present = Convert.ToBoolean(found);
        if (present == true)
        {
            lblMessage.Visible = true;

            lblMessage.Text = "Already Exist.";
            TextBox1.Text = "";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();


        }
        else
        {

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO CHAPTER(CHAPTER_NAME,SUBJECT_ID) values('" + TextBox1.Text + "'," + DropDownList2.SelectedValue + ")";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            TextBox1.Text = "";

            lblMessage.Visible = true;
            lblMessage.Text = "Subject Inserted";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();

        }
    }
}