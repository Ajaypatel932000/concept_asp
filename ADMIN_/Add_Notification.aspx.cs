using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ADMIN_Add_Notification : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        String mycon = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        con = new SqlConnection(mycon);
        con.Open();
        lblMessage.Visible = false;
   
    }
   
    private void saveNotification(int rollno, String date)
    {

        String query = "insert into notification(Notification_Date,Message,Enrollment_id) values('" + date + "','" + TextBox1.Text + "','" + rollno + "')";

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = query;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String date = DateTime.Now.ToShortDateString();

        foreach (GridViewRow row in GridView1.Rows)
        {
            // String date = DateTime.Now.ToShortDateString();
            int rollno1 = Convert.ToInt32(row.Cells[0].Text);
            // String studentname1 = row.Cells[1].Text;
            CheckBox status = (CheckBox)(row.Cells[2].FindControl("CheckBox1"));
            // when status checked that student notification not send
            //   string sql = "SELECT COUNT(*) FROM Notification WHERE Message LIKE '" + Convert.ToString(TextBox1.Text) + "' AND Notification_Date LIKE '"+date+"' AND Enrollment_Id="+rollno1;
            //  SqlCommand findValue = new SqlCommand(sql, con);
            // int found = Convert.ToInt32(findValue.ExecuteScalar());
            // bool present = Convert.ToBoolean(found);
            // suppose student checked and same date , same enrollment and same message not send to student
            if (status.Checked)
            {
                continue;

            }
            else
            {
                saveNotification(rollno1, date);
            }


        }
        lblMessage.Visible = true;
        lblMessage.Text = "Notification Has Been Send Successfully";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        TextBox1.Text = "";
       
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        /*CheckBox chk = (CheckBox)GridView1.FindControl("CheckBox2");
       
        if (chk.Checked == true)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++ )
            {
                CheckBox chklst = GridView1.Rows[i].Cells[2].Controls;
                chklst.Checked = true;
            }
        }*/
    }
}