using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class Registration : System.Web.UI.Page
{
    SqlConnection cn;
    public String name;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();
    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {

        TextBox usernm;
        usernm = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
        name = usernm.Text;
        Label11.Text = name;

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = "SELECT UserId FROM aspnet_Users WHERE UserName = '" + name + "'";
        Label12.Text = Convert.ToString(cmd.ExecuteScalar());


        SqlCommand cmd3 = new SqlCommand();
        cmd3.CommandText = "SELECT RoleId FROM aspnet_Roles WHERE RoleName='Student'";
        cmd3.Connection = cn;
        Label13.Text = Convert.ToString(cmd3.ExecuteScalar());


        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "INSERT INTO aspnet_UsersInRoles (UserId ,RoleId) VALUES ('" + Label12.Text + "' , '" + Label13.Text + "')";
        cmd2.Connection = cn;
        cmd2.ExecuteNonQuery();



    }
    protected void CreateUserWizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Profile.ProfilePic = FileUpload1.FileName;
        Profile.Name = TextBox_Name1.Text;
        //Profile.Gender = RadioButtonList_Gender1.SelectedValue;
        Profile.Gender = Request.Form["Gender"].ToString();
        Profile.MobileNo = TextBox_Mobile1.Text;
        Profile.Address = TextBox_Address1.Text;

        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("~/App_Themes/Theme1/assets/images/" + FileUpload1.FileName));
        }
        
      /*  SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "INSERT INTO Student (Birth_Date, M_Mobile_No, F_Mobile_No,UserName) VALUES ('" +  +"' , '" + TextBox_Mother1.Text + "' , '" + TextBox_Father1.Text + "' , '" + Label11.Text + "')";
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();*/
        // insert into enrollment table 

        SqlCommand std_id = new SqlCommand();
        std_id.CommandText = "SELECT STUDENT_ID FROM STUDENT WHERE UserName = '" + Label11.Text + "'";
        std_id.Connection = cn;
        int id = Convert.ToInt32(std_id.ExecuteScalar());


        int standard_id = Convert.ToInt16(DropDownList2.SelectedValue);
        SqlCommand cmdid = new SqlCommand();
        cmdid.CommandText = "SELECT BATCH_ID FROM BATCH WHERE BATCH_NAME = '" + DropDownList1.SelectedValue + "'";
        cmdid.Connection = cn;
        int batchid = Convert.ToInt16(cmdid.ExecuteScalar());
        string fees = TextBox1.Text;
        String date = DateTime.Today.ToShortDateString();


        string sql = "INSERT INTO ENROLLMENT(EDate,Total_Fees,Student_Id,Batch_id,Standard_id) Values('" + date + "'," + fees + "," + id + "," + batchid + "," + standard_id + ")";
        SqlCommand cmdEnroll = new SqlCommand();
        cmdEnroll.CommandText = sql;
        cmdEnroll.Connection = cn;
        cmdEnroll.ExecuteNonQuery();


    }

    protected void Button1_Click(object sender, System.EventArgs e)
    {
        string item = "";
        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected == true)
            {
                if (item == "")
                {
                    item = CheckBoxList1.Items[i].Value;
                }

                else
                {
                    item += "," + CheckBoxList1.Items[i].Value;
                }
            }
        }

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT BATCH_NAME FROM BATCH WHERE BATCH_ID IN (SELECT Batch_Id FROM Batch_Subject AS B WHERE (Subject_Id IN (" + item + "))GROUP BY Batch_Id HAVING (COUNT(Batch_Id)=(SELECT COUNT(Batch_Id) FROM  Batch_Subject AS B1 WHERE (Batch_Id = B.Batch_Id))))";
        cmd.Connection = cn;


        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        DropDownList1.Items.Clear();
        while (dr.Read())
        {
            ListItem li = new ListItem();
            li.Text = Convert.ToString(dr.GetValue(0));
            DropDownList1.Items.Add(li);
        }
        dr.Close();

        if (DropDownList1.Items.Count == 0)
        {
            lblMessage.Visible = true;
            lblMessage.Text = "No batch available";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        }
    }
}