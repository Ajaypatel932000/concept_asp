using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("Hello");
      // Label2.Text = "Hii";
        
       
        Label2.Text = Convert.ToString(Session["Qid"]);
    }
    
    protected void getValue(object sender, EventArgs e)
    {
        Response.Write("Hello");
      //  Label2.Text = "Changed";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt16(Session["Qid"]);
        id += 1;
        Session["Qid"] = Convert.ToString(id);
        Label2.Text = Convert.ToString(id);
    }
}