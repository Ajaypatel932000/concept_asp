using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Student_View_Attendance : System.Web.UI.Page
{
    protected SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();
        Label2.Text = Convert.ToString(Session["Eid"]);


        Panel1.Visible = true;
        Panel2.Visible = false;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = DropDownList1.SelectedValue;
        Panel1.Visible = false;
        Panel2.Visible = true;
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        /* if (Label1.Text == Convert.ToString(0))
         {
             Label1.Text = "Absent";
         }
         else
         {
             Label1.Text = "Present";
         }
         GridView grid;
         GridViewRow row = grid.Rows[e.ToString(0)];// MyGrid.Rows[e.RowIndex];
         Label MyLabel = (Label)row.FindControl("MyLabel"); */




    }
    protected void Panel1_Load(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT COUNT(Enrollment_Id) FROM Attendance WHERE Enrollment_Id = " + Label2.Text;
        cmd.Connection = cn;
        int total;
        total = Convert.ToInt32(cmd.ExecuteScalar());
        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "SELECT COUNT(Enrollment_Id) FROM Attendance WHERE Enrollment_Id =" + Label2.Text + " AND Status='True'";
        cmd2.Connection = cn;
        int value;
        value = Convert.ToInt32(cmd2.ExecuteScalar());

        Label1.Text = value + " sessions attended out of " + total + " days.";
    }
    protected void Panel2_Load(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT COUNT(Enrollment_Id) FROM Attendance WHERE Enrollment_Id =" + Label2.Text + " AND MONTH(A_Date)=" + DropDownList1.SelectedValue;
        cmd.Connection = cn;
        int total1;
        total1 = Convert.ToInt32(cmd.ExecuteScalar());
        SqlCommand cmd3 = new SqlCommand();
        cmd3.CommandText = "SELECT COUNT(Enrollment_Id) FROM Attendance WHERE Enrollment_Id =" + Label2.Text + " AND Status='True' AND MONTH(A_Date)=" + DropDownList1.SelectedValue;
        cmd3.Connection = cn;
        int value1;
        value1 = Convert.ToInt32(cmd3.ExecuteScalar());
        Label3.Text = value1 + " sessions attended out of " + total1 + " days.";
    }
}