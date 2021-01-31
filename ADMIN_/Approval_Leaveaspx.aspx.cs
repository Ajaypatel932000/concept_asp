using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Approval_Leaveaspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    private void updaterow(int enrollmentid, int approval, int id)
    {
        String mycon = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        String updatedata = "Update Leave_Application SET Status='" + approval + "' where enrollment_id=" + enrollmentid + "AND Leave_Id =" + id;
        SqlConnection con = new SqlConnection(mycon);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox status = (CheckBox)(row.Cells[7].FindControl("CheckBox1"));
            int Leave_id = Convert.ToInt32(row.Cells[0].Text);

            //   Label lbl=(Label)(row.Cells[6].FindControl("Label1"));
            // lbl.Text = "hello done";
            int enrollid = Convert.ToInt32(row.Cells[3].Text);
            if (status.Checked)
            {
                updaterow(enrollid, 1, Leave_id);
                Response.Write("checked = " + status);
                Response.Write("id =" + enrollid);
                GridView1.DataBind();


                lblMessage.Visible = true;
                lblMessage.Text = "Approval Sucessfully";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            }

        }
    }
}