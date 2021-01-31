using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ADMIN_Fees_Details : System.Web.UI.Page
{
    SqlConnection cn;
    protected static int remain;
    protected void Page_Load(object sender, EventArgs e)
    {


        showValue();
        Panel1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;

        TextBox1.Text = DateTime.Now.ToShortDateString();
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox3.Visible = false;
        Label14.Visible = false;

        Label lbl = (Label)FormView1.FindControl("RemainingFeesLabel");
        TextBox4.Text = lbl.Text;
    }
 
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        TextBox1.Text = DateTime.Now.ToShortDateString();
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox3.Visible = false;
        Label14.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;

        TextBox1.Text = DateTime.Now.ToShortDateString();
        TextBox2.Text = "";
        TextBox3.Text = "";

        TextBox3.Visible = true;
        Label14.Visible = true;
    }
    protected void FormView2_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        Panel1.Visible = false;
        GridView1.DataBind();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();

        if (TextBox3.Text == "")
        {
            cmd.CommandText = "INSERT INTO FEES_PAYMENT (FDATE, ENROLLMENT_ID, AMOUNT_PAID, PAYMENT_TYPE) VALUES ('" + TextBox1.Text + "' , " + Request.QueryString["fees"] + " , " + TextBox2.Text + " , 'Cash')";
        }
        else
        {
            cmd.CommandText = "INSERT INTO FEES_PAYMENT (FDATE, ENROLLMENT_ID, AMOUNT_PAID, PAYMENT_TYPE, TRANSACTION_ID) VALUES ('" + TextBox1.Text + "' , " + Request.QueryString["fees"] + " , " + TextBox2.Text + " , 'Cheque' , '" + TextBox3.Text + "')";
        }

        cmd.Connection = cn;
        cmd.ExecuteNonQuery();

        GridView1.DataBind();
        showValue();
        
        Label lbl = (Label)FormView1.FindControl("RemainingFeesLabel");
        TextBox4.Text = lbl.Text;
        cn.Close();
        
    }
    protected void showValue()
    {
        int val;
        val = Convert.ToInt32(Request.QueryString["fees"]);
        cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True";
        cn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT Total_Fees FROM Enrollment WHERE Enrollment_Id=" + val;
        cmd.Connection = cn;
        int fees;
        fees = Convert.ToInt32(cmd.ExecuteScalar());
        int paid;

        try
        {
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "SELECT SUM(Amount_Paid) FROM Fees_Payment WHERE Enrollment_Id=" + val;
            cmd2.Connection = cn;
            paid = Convert.ToInt32(cmd2.ExecuteScalar());
        }
        catch (Exception ea)
        {
            Response.Write(ea.Message + "No amount paid till now");
            paid = 0;
        }

        Label lbl;
        lbl = (Label)FormView1.FindControl("PaidFeesLabel");

        if (lbl != null)
            lbl.Text = Convert.ToString(paid);

        Label lbl2;
        lbl2 = (Label)FormView1.FindControl("RemainingFeesLabel");

        remain = fees - paid;


        if (lbl2 != null)
        {
            if (remain == 0)
            {
                lbl2.Text = "Paid";
                Button1.Visible = false;
            }
            else
            {
                lbl2.Text = Convert.ToString(remain);
            }
        }
    }
}