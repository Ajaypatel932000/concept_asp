using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Student_Video_Download : System.Web.UI.Page
{
    SqlConnection cn;
    static int RatingValue;
    static Label lbl;
  
    protected void Page_Load(object sender, EventArgs e)
    {
        Label5.Text = Session["batch_id"].ToString();
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True");
        cn.Open();
 
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (RatingValue != 0)
        {
            string sql = "SELECT COUNT(Video_ID) FROM Video_RATING WHERE STUDENT_ID=" + Session["Sid"] + "AND Video_ID=" + e.CommandArgument;
            SqlCommand cmd1 = new SqlCommand(sql, cn);
            int count = Convert.ToInt32(cmd1.ExecuteScalar());
            bool present = Convert.ToBoolean(count);
            if (present == true)
            {
                SqlCommand update = new SqlCommand();
                update.CommandText = "UPDATE Video_RATING SET RATING=" + RatingValue + "WHERE NOTE_ID=" + e.CommandArgument + "AND STUDENT_ID=" + Session["Sid"];
                update.Connection = cn; ;
                update.ExecuteNonQuery();
                // lbl.Visible = true;
                //lbl.Text = "Rating Updated";
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            }
            else
            {
                //  Response.Write("Student_Id ="+Session["Sid"]);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "INSERT INTO Video_Rating(Video_Id,Student_Id,Rating) Values(" + e.CommandArgument + "," + Session["Sid"] + "," + RatingValue + ")";
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                // lbl.Visible = true;
                // lbl.Text = "Rating Save";
                // ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            }
        }
        else
        {
            //   lbl.Visible = true;
            //  lbl.Text = "Please Select Rating.";
            // ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

        }

    }
    protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        RatingValue = Convert.ToInt32(e.Value);

    }
}