using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login_LoggedIn(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser(Login1.UserName);
        TextBox TextBox1 = (TextBox)Login1.FindControl("UserName");

        Session["LoginName"] = user;

        if (Roles.IsUserInRole(TextBox1.Text, "Admin"))
        {
            Login1.DestinationPageUrl = "~/Default.aspx";
        }

        else if (Roles.IsUserInRole(TextBox1.Text, "Student"))
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
            cn.Open();
            // Response.Write(cn.State);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT Enrollment_Id FROM ENROLLMENT WHERE ('" + DateTime.Now.ToShortDateString() + "' BETWEEN EDate AND DATEADD(month,9,EDATE)) AND (STUDENT_ID IN (SELECT STUDENT_ID FROM STUDENT WHERE USERNAME ='" + Session["LoginName"] + "'))";
            cmd.Connection = cn;

            int id = Convert.ToInt32(cmd.ExecuteScalar());

            Session["Eid"] = id;

            SqlCommand cmd_id = new SqlCommand();
            cmd_id.CommandText = "SELECT STUDENT_ID FROM ENROLLMENT WHERE ENROLLMENT_ID=" + id;
            cmd_id.Connection = cn;
            Session["Sid"] = cmd_id.ExecuteScalar();



            SqlCommand cmdl = new SqlCommand();
            cmdl.CommandText = "SELECT BATCH_ID FROM ENROLLMENT WHERE Enrollment_id=" + id;
            cmdl.Connection = cn;
            Session["batch_id"] = Convert.ToInt32(cmdl.ExecuteScalar());
            // Response.Write(" hjgjg " + Session["batch_id"]);
            Login1.DestinationPageUrl = "~/Student/Default.aspx";

        }
        else
        {
            Response.Write("U r an anonymous user");
        }


       
    }
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {

    }
}