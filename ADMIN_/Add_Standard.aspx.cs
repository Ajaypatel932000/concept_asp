using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_Add_Standard : System.Web.UI.Page
{
    SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();
        Label2.Visible = false;
        lblMessage.Visible = false;


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Label2.Visible = true;
            return;
        }
        string sql = "SELECT Standard FROM STANDARD WHERE STANDARD =" + TextBox1.Text;

        SqlCommand findValue = new SqlCommand(sql, cn);
        int found = Convert.ToInt32(findValue.ExecuteScalar());
        bool present = Convert.ToBoolean(found);
        if (present == true)
        {
            lblMessage.Visible = true;

            lblMessage.Text = "Already Inserted";
            TextBox1.Text = "";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);


        }
        else
        {


            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO STANDARD(STANDARD) VALUES(" + TextBox1.Text + ")";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();

            GridView1.DataBind();

            lblMessage.Visible = true;
            lblMessage.Text = "Standard Inserted";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            TextBox1.Text = "";
            cn.Close();
        }
    }
   
}