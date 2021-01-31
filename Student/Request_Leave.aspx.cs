using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Student_Request_Leave : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label4.Text = Convert.ToString(Session["Eid"]);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True");
        cn.Open();
        Response.Write(" Reason " + TextBox3.Text);
        Response.Write(" date " + Convert.ToDateTime(TextBox1.Text));
        Response.Write(" date " + Convert.ToDateTime(TextBox2.Text));
        Response.Write(" Enrollment id " + Session["Eid"]);
        SqlCommand cmd = new SqlCommand();
        //int eid = Convert.ToInt32(Session["Eid"]);
        cmd.CommandText = "INSERT INTO Leave_Application(Leave_Reason,Leave_To,Leave_From,Enrollment_Id,Status) Values('" + TextBox3.Text + "','" +Convert.ToString( TextBox2.Text) + "','" +Convert.ToString( TextBox1.Text) + "'," + Session["Eid"] + ",'" + "0" + "')";
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        GridView1.DataBind();
        lblMessage.Visible = true;

        lblMessage.Text = "Request Send Sucessfully";

        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";

        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        cn.Close();

    }
}