using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
public partial class ADMIN_CreateTest : System.Web.UI.Page
{
    SqlConnection cn;
    DataTable dt = new DataTable();
    int maxValue;
    static int mark;

    protected void Page_Load(object sender, EventArgs e)
    {
        // connection open
        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();

        if (!Page.IsPostBack)
        {
            if (ViewState["Records"] == null)
            {
                dt.Columns.Add("Id");
                dt.Columns.Add("Question");
                dt.Columns.Add("Mark");

                ViewState["Records"] = dt;

            }
        }


    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        CheckBoxList2.Items.Clear();
        CheckBoxList1.Items.Clear();
        CheckBoxList3.Items.Clear();



    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckBoxList2.Items.Clear();

        mark = Convert.ToInt32(DropDownList3.SelectedValue);
        Response.Write(Convert.ToString(mark));
        CheckBoxList1.Focus();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        CheckBoxList3.Focus();
        CheckBoxList2.Items.Clear();
        CheckBoxList3.Items.Clear();

        // show Question Button

        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected == true)
            {  // fetch question with dropdwn condition 
                SqlCommand Ques_cmd = new SqlCommand();
                Ques_cmd.CommandText = "SELECT Question_Id, Question_Details FROM question_bank WHERE Subject_Id =" + DropDownList2.SelectedValue + " AND Chapter_Id =" + CheckBoxList1.Items[i].Value + " AND Minimum_Marks=" + DropDownList3.SelectedValue;
                Ques_cmd.Connection = cn;
                SqlDataReader dr = Ques_cmd.ExecuteReader();
                // here we assign checkbox2 to question and checkbox3 assign id of question
                while (dr.Read())
                {
                    CheckBoxList2.Items.Add(Convert.ToString(dr.GetValue(1)));
                    CheckBoxList3.Items.Add(Convert.ToString(dr.GetValue(0)));

                }
                dr.Close();
            }
        }

        CheckBoxList2.Focus();
    }


    protected void CheckBoxList2_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label7.Text = DropDownList2.SelectedValue;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        

        // Add Question Button

        maxValue = Convert.ToInt32(TextBox1.Text);

       // Response.Write("count the value = " + Convert.ToString(mark));
        /* CHECKING WHETHER THE QUESTION SELECTED ALREADY EXIST OR NOT ... */

        int i = GridView1.Rows.Count;
        if (i == 0)
        {
            for (int k = 0; k < CheckBoxList2.Items.Count; k++)
            {
                if (CheckBoxList2.Items[k].Selected == true)
                {
                    dt = (DataTable)ViewState["Records"];
                    dt.Rows.Add(CheckBoxList3.Items[k], CheckBoxList2.Items[k], DropDownList3.SelectedItem);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    ViewState["count"] = Convert.ToInt32(ViewState["count"]) + mark;

                }
            }
            return;
        }
        else
        {
            /* THIS LOOP WILL EXECUTE ALL THE ITEMS IN CHECKBOXLIST */
            for (int l = 0; l < CheckBoxList2.Items.Count; l++)
            {
                //IF THE ITEM IS CHECKED THEN IF CONDITION WILL BE EXECUTED 

                if (CheckBoxList2.Items[l].Selected == true)
                {
                    string ckcval = CheckBoxList2.Items[l].ToString();
                    int count = GridView1.Rows.Count;
                    int j = 0;
                    int same_v = 0;


                    // THIS LOOP WILL CHECK THAT THE CHECKED ITEM IS THERE IN GRIDVIEW OR NOT 
                    while (j < count)
                    {
                        string str = GridView1.Rows[j].Cells[1].Text;


                        // IF VALUE EXIST THAN THE VARAILE WILL BE INCREAMENTED AND WHILE LOOP WILL BE BREAKED
                        if (str == ckcval)
                        {
                            same_v++;
                            break;
                        }

                        j++;
                    }

                    // IF VALUE DOESNOT EXIST THAN IT WILL BE ADDED IN THE GRIDVIEW
                    if (same_v == 0)
                    {
                        dt = (DataTable)ViewState["Records"];
                        dt.Rows.Add(CheckBoxList3.Items[l], CheckBoxList2.Items[l], DropDownList3.SelectedItem);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        ViewState["count"] = Convert.ToInt32(ViewState["count"]) + mark;

                    }
                }
            }
        }
        GridView1.Focus();
       // Response.Write("total mark =" + ViewState["count"]);
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckBoxList1.Items.Clear();
        CheckBoxList2.Items.Clear();
        // CheckBoxList3.Items.Clear();


    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            int check = Convert.ToInt32(TextBox1.Text);
            if (check == Convert.ToInt32(ViewState["count"]))
            // insert we selected questions
            {
                SqlCommand testCmd = new SqlCommand();
                testCmd.CommandText = "INSERT INTO Test(Test_Type,Total_Questions,Total_Marks,Subject_Id) Values('" + Convert.ToString(DropDownList4.SelectedItem) + "'," + GridView1.Rows.Count + "," + check + "," + Convert.ToInt32(Label7.Text) + ")";
                testCmd.Connection = cn;
                testCmd.ExecuteNonQuery();


                SqlCommand lastTest = new SqlCommand();
                lastTest.CommandText = "SELECT max(Test_Id) FROM TEST";
                lastTest.Connection = cn;
                int t_id = Convert.ToInt32(lastTest.ExecuteScalar());
                //   Response.Write("Test Id " + t_id);

                SqlCommand ins_queCmd = new SqlCommand();

                for (int row = 0; row < GridView1.Rows.Count; row++)
                {
                    ins_queCmd.CommandText = "INSERT INTO Test_Question(Test_Id,Question_Id) VALUES (" + t_id + "," + GridView1.Rows[row].Cells[0].Text + ")";
                    ins_queCmd.Connection = cn;
                    ins_queCmd.ExecuteNonQuery();
                    //Response.Write(GridView1.Rows[row].Cells[0].Text);
                    
                }

                DropDownList1.ClearSelection();
                DropDownList2.ClearSelection();
                DropDownList3.ClearSelection();
                DropDownList4.ClearSelection();
                TextBox1.Text = "";
                CheckBoxList1.Items.Clear();
                CheckBoxList2.Items.Clear();
                GridView1.DataSource = null;
                GridView1.DataBind();
                Response.Write(@"<script language='javascript'>alert('Test is successfully generated')</script>");
            }
            else
            {
                Response.Write("Select Entered Mark paper");
            }
        }
        catch (Exception a)
        { 
            
        }
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int mk = Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[2].Text);
        DataTable dt1 = (DataTable)ViewState["Records"];
        if (dt1.Rows.Count > 0)
        {
            ViewState["count"] = Convert.ToInt32(ViewState["count"]) - mk;
            dt1.Rows[e.RowIndex].Delete();
            GridView1.DataSource = dt1;
            GridView1.DataBind();
              
        }
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        GridView1.Focus();
    }
}