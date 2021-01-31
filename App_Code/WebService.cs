using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{
    public SqlConnection cn;
    private bool Connection()
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True");
        cn.Open();

        return Convert.ToBoolean(cn.State);

    }
    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void validateUser(string a , string pass)
    {
       // string a = Context.Request.Params.Get("id");
       // string pass = Context.Request.Params.Get("pass");


        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";
        // Boolean sucess;
        var sucess = new Dictionary<string, Boolean>();
        if (Membership.ValidateUser(a, pass))
        {
            sucess.Add("Sucess", true);
        }
        else
        {
            sucess.Add("Sucess", false);
        }

        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(sucess));

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void AddNewUser(string username, string password, string email, string birthdate, string s_mob, string m_mob, string f_mob, string fullname, string gender, string address)
    {
        /* string username = Context.Request.Params.Get("");
         string password = Context.Request.Params.Get("");
         string email = Context.Request.Params.Get("");
         string birthdate = Context.Request.Params.Get("");
         string s_mob = Context.Request.Params.Get("");
         string m_mob = Context.Request.Params.Get("");
         string f_mob = Context.Request.Params.Get("");
         string fullname = Context.Request.Params.Get("");
         string gender = Context.Request.Params.Get("");
         string address = Context.Request.Params.Get("");*/
        var success = new Dictionary<string, Boolean>();


        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";

        /* MembershipCreateStatus status;
         Membership.CreateUser(username, password, email, "Username?", username, true, out status);*/
        MembershipCreateStatus status;
        Membership.CreateUser(username, password, email, "Username?", username, true, out status);
        if (status == MembershipCreateStatus.Success)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mansuri\Desktop\PROJECT2020\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
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
            success.Add("Success", true);
            cn.Close();

        }
        else
        {
            success.Add("Success", false);
        }
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(success));

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void checkUserName()
    {
        string user = Context.Request.Params.Get("username_key");
        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";

        var usernamecheck = new Dictionary<string, Boolean>();

        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mansuri\Desktop\PROJECT2020\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT COUNT(UserName) FROM aspnet_Users WHERE UserName LIKE '" + user + "'";
        cmd.Connection = cn;
        int len = Convert.ToInt32(cmd.ExecuteScalar());

        if (len == 0)
        {
            usernamecheck.Add("UsernameCheck", false);
        }
        else
        {
            usernamecheck.Add("UsernameCheck", true);
        }

        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(usernamecheck));
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void GetEnrollmentId(string username)
    {


        //string username = Context.Request.Params.Get("");

        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";

        MembershipUser user = Membership.GetUser(username);


        var values = new Dictionary<string, string>();

        if (Roles.IsUserInRole(username, "Student"))
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mansuri\Desktop\PROJECT2020\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
            cn.Open();



            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT Enrollment_Id FROM ENROLLMENT WHERE ('" + DateTime.Now.ToShortDateString() + "' BETWEEN EDate AND DATEADD(month,9,EDATE)) AND (STUDENT_ID IN (SELECT STUDENT_ID FROM STUDENT WHERE USERNAME ='" + username + "'))";
            cmd.Connection = cn;
            int id = Convert.ToInt32(cmd.ExecuteScalar());

            values.Add("Enrollment_Id", Convert.ToString(id));

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(values));
            cn.Close();
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void getSubjects(string eid)
    {
        //string eid = Context.Request.Params.Get("");

        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";



        List<Subject_details> lst = new List<Subject_details>();
        var sub_dict = new Dictionary<string, List<Subject_details>>();


        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mansuri\Desktop\PROJECT2020\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT BATCH_ID FROM ENROLLMENT WHERE Enrollment_id=" + eid;
        cmd.Connection = cn;
        int batch_id = Convert.ToInt32(cmd.ExecuteScalar());

        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "SELECT SUBJECT_ID , SUBJECT_NAME FROM SUBJECT WHERE SUBJECT_ID IN (SELECT SUBJECT_ID FROM BATCH_SUBJECT WHERE BATCH_ID = " + batch_id + ")";
        cmd2.Connection = cn;

        SqlDataReader dr = cmd2.ExecuteReader();

        while (dr.Read())
        {
            Subject_details sb = new Subject_details();

            sb.ID = Convert.ToString(dr.GetValue(0));
            sb.Name = Convert.ToString(dr.GetValue(1));
            lst.Add(sb);
        }
        sub_dict.Add("Subjects", lst);

        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(sub_dict));
        cn.Close();
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void getChapters(string sub_id)
    {
        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";


        List<Chapter_details> lst = new List<Chapter_details>();
        var chap_dict = new Dictionary<string, List<Chapter_details>>();

        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mansuri\Desktop\PROJECT2020\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT CHAPTER_ID , CHAPTER_NAME FROM CHAPTER WHERE SUBJECT_ID = " + sub_id;
        cmd.Connection = cn;

        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {

            Chapter_details sb = new Chapter_details();

            sb.ID = Convert.ToString(dr.GetValue(0));
            sb.Name = Convert.ToString(dr.GetValue(1));
            lst.Add(sb);
        }
        chap_dict.Add("Chapters", lst);
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(chap_dict));
        cn.Close();
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void getUsernameFromMobileNumber(string username)
    {
        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";

       // var mobile_no = new Dictionary<string, string>();
        var ch = new Dictionary<string, Boolean>();

        MembershipUser user = Membership.GetUser(username);
        Boolean check = user.IsApproved;
        ch.Add("Check", check);
        ProfileCommon pc = (ProfileCommon)ProfileBase.Create(username, true);
        string mobile = pc.MobileNo;
        var obj = new Dictionary<string, Boolean>();

        if (mobile != null)
        {
            Random rnd = new Random();
            int otp = rnd.Next(1000, 9999);
            String msg = "Dear Customer One Time Password Sent by Concept Classes " + otp;
            String message = HttpUtility.UrlEncode(msg);
            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "CrKUhlnLfxY-4vcZgs0KBXYutFihXLFi93fKFSy5mI"},
                {"numbers" , "8866888876"},
                {"message" , message},
                {"sender" , "TXTLCL"}
                });
                string result = System.Text.Encoding.UTF8.GetString(response);
               
              
                obj.Add("done", true);
            }
        }
        else {
            obj.Add("done", false);
        }
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(obj));
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void getNotes(string id, string chap_id, string sub_id)
    {
        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";


        List<Note_Video_Details> lst = new List<Note_Video_Details>();
        var video_dict = new Dictionary<string, List<Note_Video_Details>>();



        if (Connection())
        {

            SqlCommand cmdl = new SqlCommand();
            cmdl.CommandText = "SELECT BATCH_ID FROM ENROLLMENT WHERE Enrollment_id=" + id;
            cmdl.Connection = cn;
            int batch_id = Convert.ToInt32(cmdl.ExecuteScalar());


            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "SELECT NOTE_DETAILS , PATH FROM NOTES WHERE NOTE_ID IN (SELECT NOTE_ID FROM NOTES_BATCH WHERE BATCH_ID =" + batch_id + ") AND SUBJECT_ID =" + sub_id + " AND CHAPTER_ID=" + chap_id;
            cmd2.Connection = cn;
            SqlDataReader dr = cmd2.ExecuteReader();
            var sub = new Dictionary<string, string>();


            if (dr != null)
            {
                while (dr.Read())
                {
                    Note_Video_Details n1 = new Note_Video_Details();
                    n1.details = Convert.ToString(dr.GetValue(0));
                    n1.path = Convert.ToString(dr.GetValue(1));
                    lst.Add(n1);
                }
                video_dict.Add("Notes", lst);
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(video_dict));
            }

            cn.Close();
        }
    }
    /*[WebMethod]
    public string sendSMS()
    {
        String message = HttpUtility.UrlEncode("Hii Aayesha How r u");
        using (var wb = new WebClient())
        {
            byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "AXKz+tgm04s-t8e9k9i86aoXAxImGojPR4lbNYihpE"},
                {"numbers" , "8866888876"},
                {"message" , message},
                {"sender" , "TXTLCL"}
                });
            string result = System.Text.Encoding.UTF8.GetString(response);
            return result;
        }
    }*/


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void changeUserPassword(string username , string pass , string oldpass)
    {
        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";

        var msg = new Dictionary<string,Boolean>();

        MembershipUser user = Membership.GetUser(username);
        try
        {
            if (user.ChangePassword(oldpass, pass))
            {
                msg.Add("PasswordChange", true);
                //Msg.Text = "Password changed.";
            }
            else
            {
                msg.Add("PasswordChange", false);
              //  Msg.Text = "Password change failed. Please re-enter your values and try again.";
            }
        }
        catch (Exception e)
        {
            msg.Add("PasswordChange", false);
            //Msg.Text = "An exception occurred: " + Server.HtmlEncode(e.Message) + ". Please re-enter your values and try again.";
        }

        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(msg));

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void restUserPassword_forgotPassword(string username, string pass)
    {
        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";

        var msg = new Dictionary<string, Boolean>();
        MembershipUser mu = Membership.GetUser(username);
       // string password;
        
        if(mu != null)
        {
            try
            {
                string pas = Membership.Provider.GetPassword(username, "1");
               // password = mu.GetPassword();
                msg.Add(pas, false);
            }
            catch (Exception e)
            {
                msg.Add("PasswordChange", false);
            //Msg.Text = "An exception occurred: " + Server.HtmlEncode(e.Message) + ". Please re-enter your values and try again.";
            }
        }

        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(msg));

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void getAttendance(string eid, int month)
    {
        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";

        List<Attendence_details> lst = new List<Attendence_details>();
        var attend_dict = new Dictionary<string, List<Attendence_details>>();

        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mansuri\Desktop\PROJECT2020\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT CONVERT (varchar, A_Date, 3) AS DATE,YEAR(A_Date) AS YEAR ,DAY(A_Date) AS A_Date , CASE Status WHEN 'False' THEN 'ABSENT' ELSE 'PRESENT' END AS STATUS FROM Attendance WHERE (Enrollment_Id = " + eid + ") AND (MONTH(A_Date) = " + month + ")";
        cmd.Connection = cn;
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            Attendence_details attend = new Attendence_details();
            attend.date = Convert.ToString(dr.GetValue(0));
            attend.Year = Convert.ToString(dr.GetValue(1));
            attend.A_date = Convert.ToString(dr.GetValue(2));
            attend.Status = Convert.ToString(dr.GetValue(3));
            lst.Add(attend);
        }

        attend_dict.Add("Attendence", lst);

        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(attend_dict));
        cn.Close();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void changePasswordRandomly(string username , string userpassword)
    {
        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";

        string newpassword;
        var dict = new Dictionary<string, string>();
        MembershipUser mu = Membership.GetUser(username , false );

        if (mu == null)
        {
            dict.Add("Password", "User not found");
        }

        else
        {
            newpassword = mu.ResetPassword(username);

            if (newpassword != null)
            {
               // dict.Add("New Password", newpassword);

                if (mu.ChangePassword(newpassword, userpassword))
                {
                    dict.Add("Success", "Your password is changed succesfully");
                }
            }
            else {
                dict.Add("New Password", "not found");
            }
           
        }
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(dict));
        
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void getVideos(string eid, string chap_id, string sub_id)
    {
        Context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Context.Response.ContentType = "application/json";


        List<Note_Video_Details> lst = new List<Note_Video_Details>();
        var video_dict = new Dictionary<string, List<Note_Video_Details>>();

        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mansuri\Desktop\PROJECT2020\App_Data\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();

        SqlCommand cmdl = new SqlCommand();
        cmdl.CommandText = "SELECT BATCH_ID FROM ENROLLMENT WHERE Enrollment_id=" + eid;
        cmdl.Connection = cn;
        int batch_id = Convert.ToInt32(cmdl.ExecuteScalar());


        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "SELECT Video_Details , Path FROM Videos WHERE Video_Id IN (SELECT Video_Id FROM Videos_Batch WHERE BATCH_ID =" + batch_id + ") AND SUBJECT_ID =" + sub_id + " AND CHAPTER_ID=" + chap_id;
        cmd2.Connection = cn;
        SqlDataReader dr = cmd2.ExecuteReader();

        if (dr != null)
        {
            while (dr.Read())
            {
                Note_Video_Details n1 = new Note_Video_Details();
                n1.details = Convert.ToString(dr.GetValue(0));
                n1.path = Convert.ToString(dr.GetValue(1));
                lst.Add(n1);
            }
            video_dict.Add("Attendance", lst);
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(video_dict));
        }

        cn.Close();
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void Sample() 
    {
        var sub1 = new Dictionary<string, string>();
        var sub2 = new Dictionary<string, int>();
        sub1.Add("Name" , "Aayesha");
        sub2.Add("Age" , 10);

        var strNJson = new
        {
            to = "/topics/Group",
            notification = new
            {
                title = "Title",
                body = "Body"
            }
        };
        JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
        string json = javaScriptSerializer.Serialize(strNJson);
        
        Context.Response.Write(json);
        // var ans = new { sub1, sub2 };js.Serialize(video_dict)
        //Response.Write(ans);
        
    }
}
