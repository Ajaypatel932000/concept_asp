using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class ADMIN_Add_Option : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
        //LABEL2 USED TO STORE THE ID OF QUESTION
       Label2.Text = Request.QueryString["qid"].ToString();
       // Label2.Text = Convert.ToString(60);
        if (!Page.IsPostBack)
        {
            if (ViewState["Records"] == null)
            {
                dt.Columns.Add("optId");
                dt.Columns.Add("opt");
                ViewState["Records"] = dt;

                // LABEL6 TO STORE THE VALUE OF OPTION ID AND INCREAMENT WHEN NEXT RECORD IS INSERTED
                Label6.Text = Convert.ToString(0);
            }
            
        }
        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT Question_Details FROM Question_Bank WHERE Question_Id=" + Label2.Text;
        cmd.Connection = cn;

        string str =Convert.ToString(cmd.ExecuteScalar());
        //LABEL3 TO DISPLAY THE QUESTION 
        Label3.Text = str;
        Label7.Visible = false;
        lblMessage.Visible = false;

        if (GridView2.Rows.Count < 1)
            Button2.Visible = false;  
        else
            Button2.Visible = true;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Label7.Visible = true;
            return;
        }

        int i = GridView2.Rows.Count;
        int j=0;
        int count = 0;
       // Response.Write(i);

        if (i == 0)
        {
            int optid = Convert.ToInt32(Label6.Text) + 1;
            Label6.Text = Convert.ToString(optid);
            dt = (DataTable)ViewState["Records"];

            dt.Rows.Add(optid , TextBox1.Text);

            GridView2.DataSource = dt;
            GridView2.DataBind();
            TextBox1.Text = "";
            return;
        }
        else
        {
            while (j < i)
            {
                string opt = GridView2.Rows[j].Cells[2].Text;

                if (opt == TextBox1.Text)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Already Inserted";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    count++;
                    break;
                }
                j++;
            }

            if (count == 0)
            {
                int optid = Convert.ToInt32(Label6.Text) + 1;
                Label6.Text = Convert.ToString(optid);
                dt = (DataTable)ViewState["Records"];

                dt.Rows.Add(optid, TextBox1.Text);

                GridView2.DataSource = dt;
                GridView2.DataBind();
                TextBox1.Text = "";
            }
            TextBox1.Text = "";
        }
    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt1 = (DataTable)ViewState["Records"];

        if (dt1.Rows.Count > 0)
        {
            dt1.Rows[e.RowIndex].Delete();
            GridView2.DataSource = dt1;
            GridView2.DataBind();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (GridView2.Rows.Count <= 1)
        { 
            
        }
        string abc = Request.Form["RadioButton1"];
        Response.Write(abc);

        int i;
        for (i = 0; i < GridView2.Rows.Count; i++)
        {
            string val = GridView2.Rows[i].Cells[2].Text;

            if (val == abc)
            {
                Label5.Text = GridView2.Rows[i].Cells[1].Text;
                break;
            }
        }
        //Response.Write(i);

        for (i = 0; i < GridView2.Rows.Count; i++)
        {
            string val2 = GridView2.Rows[i].Cells[2].Text;
            int id = Convert.ToInt32(GridView2.Rows[i].Cells[1].Text);
            SqlCommand cmdopt = new SqlCommand();
            cmdopt.CommandText = "INSERT INTO Option_T (Option_Value, Question_Id, Option_Id) VALUES ('" + val2 + "' , " + Label2.Text + " , " + id + ")";
            cmdopt.Connection = cn;
            cmdopt.ExecuteNonQuery();
        }

        SqlCommand Inscmd = new SqlCommand();
        Inscmd.CommandText = "UPDATE Question_Bank SET Correct_Option='" + Label5.Text + "' WHERE Question_Id=" + Convert.ToInt32(Label2.Text);
        Inscmd.Connection = cn;
        Inscmd.ExecuteNonQuery();
        Response.Redirect("~/ADMIN_/AddQuestion.aspx");
    }
}