using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Add_Subject_ : System.Web.UI.Page
{
    SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();
        
        lblMessage.Visible = false;

    }
   
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            lblMessage.Visible = true;

            lblMessage.Text = "Enter Valid Name.";
           
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            return;
        }
        string sql = "SELECT SUBJECT_ID FROM SUBJECT WHERE SUBJECT_NAME LIKE '" + TextBox1.Text + "'AND STANDARD_ID =" + DropDownList1.SelectedValue;

        SqlCommand findValue = new SqlCommand(sql, cn);
        int found = Convert.ToInt32(findValue.ExecuteScalar());
        bool present = Convert.ToBoolean(found);
        if (present == true)
        {
            lblMessage.Visible = true;

            lblMessage.Text = "Already Exist";
            TextBox1.Text = "";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);


        }
        else
        {

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO SUBJECT(SUBJECT_NAME,STANDARD_ID) VALUES('" + TextBox1.Text + "'" + "," + DropDownList1.SelectedValue + ")";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            GridView1.DataBind();

            lblMessage.Visible = true;
            lblMessage.Text = "Subject Inserted";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            TextBox1.Text = "";

            cn.Close();
        }
    }
}