using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.Profile;

public partial class SampleRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         string username = TextBox1.Text;
         string password = TextBox7.Text;
         string email = TextBox5.Text;
         string birthdate = Request["date1"];
         string s_mob = TextBox2.Text;
         string m_mob = TextBox6.Text;
         string f_mob = TextBox4.Text;
         string fullname = TextBox3.Text;
         string gender = Request.Form["Gender"].ToString();
         string address = TextBox9.Text;
       

        MembershipCreateStatus status;
        Membership.CreateUser(username, password, email, "Username?", username, true, out status);
        if (status == MembershipCreateStatus.Success)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO STUDENT(Birth_Date, M_Mobile_No, F_Mobile_No,UserName) VALUES ('" + birthdate + "' , '" + m_mob + "' , '" + f_mob + "' , '" + username + "')";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();


            ProfileCommon pc = (ProfileCommon)ProfileBase.Create(username, true);
            pc.Name = fullname;
            pc.Address = address;
            pc.Gender = gender;
            pc.MobileNo = s_mob;
            pc.Save();
            cn.Close();

        }
        else
        {
            Response.Write("<script>alert('Enter another username')</script>");  
        }
    }
}