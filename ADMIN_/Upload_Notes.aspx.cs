using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class ADMIN_Upload_Notes : System.Web.UI.Page
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
        DropDownList2.Items.Clear();
        DropDownList3.Items.Clear();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
    }
 

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand count = new SqlCommand();
        count.CommandText = "SELECT MAX(NOTE_ID) FROM NOTES";
        count.Connection = cn;
        int cnt = Convert.ToInt32(count.ExecuteScalar());
        cnt += 1;
        string sql = "SELECT NOTE_ID FROM NOTES WHERE PATH LIKE" + "'" + "~/Note/" + FileUpload1.FileName + "'";

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

            if (FileUpload1.HasFile)
            {
                //jpg","pdf","jpeg","gif","png","doc","docx","xls","xlsx","ppt","pptx","txt","zip","rar","gzip"

                //  cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\GOTU\Desktop\exam30\Concept_class\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True");
                // cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "INSERT INTO NOTES(Note_Details,PATH,CHAPTER_ID,SUBJECT_ID)VALUES('" + TextBox1.Text + "','" + "~/Note/" + FileUpload1.FileName + "'," + DropDownList3.SelectedValue + "," + DropDownList2.SelectedValue + ")";
                cmd.Connection = cn;
                SqlCommand note_batch = new SqlCommand();
                note_batch.CommandText = "INSERT INTO NOTES_BATCH(NOTES_ID,BATCH_ID) VALUES(" + cnt + "," + DropDownList4.SelectedValue + ")";
                note_batch.Connection = cn;
                FileUpload1.SaveAs(Server.MapPath("~/Note/" + FileUpload1.FileName));
                cmd.ExecuteNonQuery();
                note_batch.ExecuteNonQuery();

                lblMessage.Visible = true;
                lblMessage.Text = "File Uploaded";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

                GridView1.DataBind();
                //DropDownList1.Items.Clear();
                DropDownList2.Items.Clear();
                DropDownList3.Items.Clear();
                TextBox1.Text = "";



            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Please Select File";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            }

        }
    }
}