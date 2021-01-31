using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Student_Test : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (ViewState["Records"] == null)
            {
                dt.Columns.Add("qid");
                dt.Columns.Add("copt");
                dt.Columns.Add("aopt");
                dt.Columns.Add("marks");
                dt.Columns.Add("item");
                ViewState["Records"] = dt;
                Session["Qid"] = 0;
                QuestionNo.Text = Convert.ToString(1);
                QuestionID.Text = GridView1.Rows[0].Cells[0].Text;
                LabelQuestion.Text = GridView1.Rows[0].Cells[1].Text;
            }
            
        }
        
       
       
        for (int i = 1; i <= GridView1.Rows.Count; i++)
        {
          
            Button btn = new Button();
            btn.Text = Convert.ToString(i);
            btn.Click += new EventHandler(this.button_click);
            Panel1.Controls.Add(btn);
            
            
            
        }
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        addValue();
        Session["Qid"] = Convert.ToInt16(Session["Qid"]) + 1;
        int id = Convert.ToInt16(Session["Qid"]);
        

        //MAKING THE NEXT BUTTON VISIBLE AND INVISIBLE.
        if (id < GridView1.Rows.Count-1)
            Button1.Visible = true;
        else
            Button1.Visible = false;
        
        //INCREAMENTING THE QUESTIONS.
       // Response.Write(Convert.ToString(id));
        QuestionNo.Text = Convert.ToString(id+1);
        QuestionID.Text = GridView1.Rows[id].Cells[0].Text;
        LabelQuestion.Text = GridView1.Rows[id].Cells[1].Text;
        RadioButtonList1.DataBind();
        LoadButton();
    }

    protected void addValue()
    {

        int id = Convert.ToInt16(Session["Qid"]);
        string Question_Id = GridView1.Rows[id].Cells[0].Text;
        string crtopt = GridView1.Rows[id].Cells[3].Text;
        
        int marks = Convert.ToInt16( GridView1.Rows[id].Cells[4].Text);
        dt = (DataTable)ViewState["Records"];
        int i = GridView2.Rows.Count;
        int j;

        for (j = 0; j < i; j++)
        {
            string val = GridView2.Rows[j].Cells[0].Text;

            if (val == Question_Id)
            {
                int a, ind;
                dt.Rows[j].Delete();
                if (RadioButtonList1.SelectedValue == "")
                {
                    a = 0;
                    ind = -1;
                }
                else
                {
                    a = Convert.ToInt16(RadioButtonList1.SelectedValue);
                    ind = Convert.ToInt16(RadioButtonList1.SelectedIndex);
                }
                dt.Rows.Add(Question_Id, crtopt, a, marks, ind);
                GridView2.DataSource = dt;
                GridView2.DataBind();
                return;
            }
        }
        int b, ind1;
        if (RadioButtonList1.SelectedValue == "")
        {
            b = 0;
            ind1 = -1;

        }
        else
        {
            b = Convert.ToInt16(RadioButtonList1.SelectedValue);
            ind1 = Convert.ToInt16(RadioButtonList1.SelectedIndex);

        }
        dt.Rows.Add(Question_Id, crtopt, b, marks, ind1);
        GridView2.DataSource = dt;
        GridView2.DataBind();
        return;
    }

    void button_click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        Session["Qid"] = Convert.ToInt16(btn.Text)-1;
        int id = Convert.ToInt16(Session["Qid"]);

        if (id < GridView1.Rows.Count - 1)
            Button1.Visible = true;
        else
            Button1.Visible = false;

        //INCREAMENTING THE QUESTIONS.
        // Response.Write(Convert.ToString(id));
        QuestionNo.Text = Convert.ToString(id+1);
        QuestionID.Text = GridView1.Rows[id].Cells[0].Text;
        LabelQuestion.Text = GridView1.Rows[id].Cells[1].Text;
        RadioButtonList1.DataBind();
        LoadButton();
        
    }

    void LoadButton()
    {
        int count = GridView2.Rows.Count;
        int j;

        for (j = 0; j < count; j++)
        {
            string val = GridView2.Rows[j].Cells[0].Text;
            //Response.Write("\n GRID QUES ID" + val);
            if (QuestionID.Text == val)
            {
                int index = Convert.ToInt16(GridView2.Rows[j].Cells[4].Text);
              //  Response.Write("INDEX" + index);
                if (index == -1)
                {
                    //Response.Write("REturn");
                    return;
                }
                else
                {
                    //Response.Write("Executed");
                    //Response.Write(RadioButtonList1.Items[index]);
                    RadioButtonList1.Items[index].Selected = true;
                    return;
                }


            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        addValue();
       

        SqlConnection cn;
        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();
        int testid = Convert.ToInt16( Request.QueryString["test"]);
        int qidlbl = Convert.ToInt16(QuestionID.Text);
        if (GridView1.Rows.Count != GridView2.Rows.Count)
        {
           
            
            Response.Write(qidlbl);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT Question_Id, Correct_Option, Minimum_Marks FROM Question_Bank WHERE Question_Id IN (SELECT Question_Id FROM Test_Question WHERE Test_Id=" + testid + " AND Question_Id > " + QuestionID.Text + ")";
            cmd.Connection = cn;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            dt = (DataTable)ViewState["Records"];
            while (dr.Read())
            {
                dt.Rows.Add(dr.GetValue(0), dr.GetValue(1), 0 , dr.GetValue(2));
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            dr.Close();
          }

          int countmarks = 0;
       
        
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            string qid = GridView2.Rows[i].Cells[0].Text;
            string correctopt = GridView2.Rows[i].Cells[1].Text;
            string marks = GridView2.Rows[i].Cells[3].Text;
            string attempotp;
            attempotp = GridView2.Rows[i].Cells[2].Text;
            if (attempotp != Convert.ToString(0))
            {
                Response.Write(i + "opt" + attempotp);
                if (correctopt == attempotp)
                {
                    countmarks += Convert.ToInt16(marks);
                }

            }
           /* Response.Write("NO" + i);
            Response.Write("enroll" + Session["Eid"]);
            Response.Write("enroll" + qid);
            Response.Write("testid " + testid);
            Response.Write("Attempt" + attempotp);
            Response.Write("correct" + correctopt);
            Response.Write("<br />");*/
           
            SqlCommand cmdopt = new SqlCommand();
            cmdopt.CommandText = "INSERT INTO Test_Answered_Paper (Enrollment_Id , Test_Id , Question_Id , Attempted_option , Correct_Option) VALUES (" + Session["Eid"] + " , " + testid + " , " + qid + " , " + attempotp + " , " + correctopt + ")";
            cmdopt.Connection = cn;
            cmdopt.ExecuteNonQuery();
        }

        /*Response.Write("enroll" + Session["Eid"]);
        Response.Write("testid " + testid);
        Response.Write("marks" + countmarks);*/
        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "INSERT INTO Result (Enrollment_Id ,Test_Id , Obtained_Mark) VALUES (" + Session["Eid"] + " , " + testid + " , " + countmarks + ")";
        cmd2.Connection = cn;
        cmd2.ExecuteNonQuery();
        
        Response.Redirect("~/Student/TestReport.aspx?testid=" + testid);
    }

}