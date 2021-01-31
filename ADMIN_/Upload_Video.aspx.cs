using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;


public partial class ADMIN_Upload_Video : System.Web.UI.Page
{
    SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();
        lblMessage.Visible = false;

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string sql = "SELECT Video_id FROM Video WHERE PATH LIKE" + "'" + "~/Video/" + FileUpload1.FileName + "'";

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

                string path = Path.GetFileName(FileUpload1.FileName);
                path = path.Replace(" ", "");
        
                FileUpload1.SaveAs(Server.MapPath("~/Videos/"+path));
                string link ="../Videos/"+path;
                //link = "<Video width=400 controls><Source src="+link+" type=video/mp4></video>";
                Response.Write(DropDownList1.SelectedValue);
                Response.Write(DropDownList2.SelectedValue);
                         SqlCommand cmd = new SqlCommand();
                // cmd.CommandText = "INSERT INTO Video (Video_Details,PATH,CHAPTER_ID,SUBJECT_ID)VALUES('" + TextBox1.Text + "','" + link + "'," + DropDownList3.SelectedValue + "," + DropDownList2.SelectedValue + ")";
               
                cmd.CommandText = "INSERT INTO Video(VIDEO_Details,Chapter_Id,Subject_Id) VALUES('" + TextBox1.Text + "'," + DropDownList3.SelectedValue + "," + DropDownList2.SelectedValue + ")";
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();

                SqlCommand max_id=new SqlCommand("SELECT MAX(Video_Id) FROM VIDEO",cn);
                int id=Convert.ToInt32(max_id.ExecuteScalar());
               SqlCommand insert_Video_Batch=new SqlCommand();
                insert_Video_Batch.CommandText = "INSERT INTO Video_Batch VALUES(" + id + "," + DropDownList4.SelectedValue + ")";
                insert_Video_Batch.Connection = cn;
                insert_Video_Batch.ExecuteNonQuery();
                
                SqlCommand update = new SqlCommand();
               // update.CommandText = "UPDATE Video SET PATH="+'"'+link+'"'+" WHERE Video_Id=" + id;
                
                update.CommandText = "UPDATE Video SET PATH='<Video width=400 controls><Source src="+link+" type=video/mp4></video>' WHERE Video_Id=" + id;
                update.Connection = cn;
                update.ExecuteNonQuery();

                lblMessage.Visible = true;
                lblMessage.Text = "File Uploaded";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

                GridView1.DataBind();
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Please Select File";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            }

            //     DropDownList1.Items.Clear();
          //  DropDownList2.Items.Clear();
          //  DropDownList3.Items.Clear();
            TextBox1.Text = "";

        }


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
}