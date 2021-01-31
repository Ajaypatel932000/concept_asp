using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ADMIN_Add_Batch : System.Web.UI.Page
{
    SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();
        lblMessage.Visible = false;
    

    }
  
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Enter Batch Name";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

        }
        else
        {
            string sql = "SELECT COUNT(*) FROM Batch WHERE Batch_Name LIKE '" + Convert.ToString(TextBox1.Text) + "'";

            SqlCommand findValue = new SqlCommand(sql, cn);
            int found = Convert.ToInt32(findValue.ExecuteScalar());
            bool present = Convert.ToBoolean(found);
            if (present == true)
            {
                // this is code for when Record will exits than this code executed and print the label to few second.
                lblMessage.Visible = true;

                lblMessage.Text = "Already Exist.";
                TextBox1.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);


            }
            else
            {
                ////        /*
                ////      record does not exits than insert query execute
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "INSERT INTO Batch(Batch_Name,Standard_Id) VALUES('" + TextBox1.Text + "'," + DropDownList1.SelectedValue + ")"; ;
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();

                ////          SqlDataAdapter adpSql = new SqlDataAdapter("SELECT STANDARD FROM STANDARD", cn);
                ////          DataTable dt = new DataTable();
                ////          adpSql.Fill(dt);
                ////          GridView1.DataSource = dt;*/
                SqlCommand cmdbatchid = new SqlCommand();
                cmdbatchid.CommandText = "SELECT BATCH_ID FROM BATCH WHERE BATCH_NAME = '" + TextBox1.Text + "'";
                cmdbatchid.Connection = cn;
                int batch_id = Convert.ToInt16(cmdbatchid.ExecuteScalar());

                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected == true)
                    {
                        SqlCommand cmdins = new SqlCommand();
                        cmdins.CommandText = "INSERT INTO BATCH_SUBJECT (BATCH_ID , SUBJECT_ID) VALUES (" + batch_id + " , " + CheckBoxList1.Items[i].Value + ")";
                        cmdins.Connection = cn;
                        cmdins.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();

                lblMessage.Visible = true;
                lblMessage.Text = "Batch  Inserted";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                TextBox1.Text = "";

                cn.Close();
                ////        */
            }
        }
    }
   
}