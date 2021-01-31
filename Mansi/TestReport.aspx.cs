using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Student_TestReport : System.Web.UI.Page
{
    SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
       LabelTestId.Text = Request.QueryString["testid"].ToString();
       // LabelTestId.Text = "6";
        int enrollid = Convert.ToInt16(Session["Eid"]);
       // int enrollid = 3;

        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT Obtained_Mark FROM Result WHERE Enrollment_Id = " + enrollid + " AND Test_Id = " + LabelTestId.Text;
        cmd.Connection = cn;
        int correct = Convert.ToInt16(cmd.ExecuteScalar());
        LabelScore.Text = Convert.ToString(correct);

        SqlCommand cmdincorrect = new SqlCommand();
        cmdincorrect.CommandText = "SELECT COUNT(*) FROM Test_Answered_Paper WHERE (Test_Id = " + LabelTestId.Text + ") AND (Enrollment_Id = " + enrollid + ") AND (Attempted_option <> Correct_Option)";
        cmdincorrect.Connection = cn;
        LabelInCorrect.Text = Convert.ToString(cmdincorrect.ExecuteScalar());

        SqlCommand cmdtotal = new SqlCommand();
        cmdtotal.CommandText = "SELECT COUNT(*) FROM TEST_ANSWERED_PAPER WHERE ENROLLMENT_ID = " + enrollid + " AND TEST_ID = " + LabelTestId.Text;
        cmdtotal.Connection = cn;
        int total = Convert.ToInt16(cmdtotal.ExecuteScalar());

       // int correct = total - Convert.ToInt16(LabelScore.Text);
        LabelPercentage.Text = Convert.ToString((correct * 100) / total);
    }
}